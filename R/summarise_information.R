summarise_versions = function(server, token) {
  cli::cli_h2("R/Python/Quarto versions")
  software = c("r", "python", "quarto")

  installed = purrr::map(software, ~get_server_settings(server, token, .x))
  installed = purrr::map2(software, installed, augment_installed)
  # Side effect only function
  purrr::map2(software, installed, print_colour_versions)

  combined_installed = dplyr::bind_rows(installed)
  return(combined_installed)
}

get_server_settings = function(server, token, type = c("r", "python", "quarto")) {
  type = match.arg(type)
  res = httr::GET(paste0(server, "/__api__/v1/server_settings/", type),
                  httr::add_headers(Authorization = paste("Key", token)))
  content = httr::content(res)
  purrr::map_chr(content$installations, ~.x$version)
}

augment_installed = function(software, installed) {
  installed = dplyr::tibble(software = software, installed = installed)
  installed$installed_major = get_major(installed$installed)
  installed$installed_minor = get_minor(installed$installed)
  installed = add_upgrade_column(installed)
  dplyr::filter(installed, software == .env$software)
}

get_major = function(v) as.numeric(unlist(stringr::str_match(v, "^([0-9]+\\.[0-9]+)")[, 2]))
get_minor = function(v) as.numeric(unlist(stringr::str_match(v, "\\.([0-9]+)$")[, 2]))
add_upgrade_column = function(installed) {
  latest = get_latest_versions()
  latest = truncate_versions(latest, installed)

  dplyr::left_join(latest, installed,
                   by = c("software" = "software", "major" = "installed_major")) |>
    dplyr::mutate(upgrade = .data$version > .data$installed) |>
    dplyr::mutate(upgrade = is.na(.data$upgrade) | .data$upgrade)
}

get_latest_versions = function() {
  versions = system.file("extdata", "versions", "versions.csv",
                         package = "jrHealthCheckConnect",
                         mustWork = TRUE)
  versions = dplyr::as_tibble(utils::read.csv(versions))
  versions$major = get_major(versions$version)
  versions$minor = get_minor(versions$version)
  return(versions)
}

truncate_versions = function(latest, installed) {
  min_installed = installed |>
    dplyr::group_by(.data$software) |>
    dplyr::summarise("min_major" = min(.data$installed_major))

  truncated_latest = latest |>
    dplyr::left_join(min_installed, by = c("software" = "software")) |>
    dplyr::filter(.data$major >= .data$min_major | is.na(.data$min_major))

  dplyr::select(truncated_latest, -"min_major")
}

## Output functions
print_colour_versions = function(software, installed) {
  no_of_rows = seq_len(nrow(installed))
  version_strings = purrr::map(no_of_rows,
                               ~colour_version(installed[.x, ]$upgrade, installed[.x, ]$installed))
  versions = glue::glue_collapse(version_strings, sep = ", ") #nolint
  cli::cli_alert_info("{stringr::str_to_title(software)} versions: {versions}")
  return(invisible(NULL))
}

colour_version = function(upgrade, installed) {
  if (is.na(upgrade) || isTRUE(upgrade)) {
    cli::col_red(installed)
  } else {
    cli::col_green(installed)
  }
}
