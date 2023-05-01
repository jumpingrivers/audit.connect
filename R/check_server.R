check_server_version = function(server, token, debug_level) {
  suppress = get_suppress(debug_level)
  cli::cli_h2("Checking Server Version")
  client = suppress(connectapi::connect(server = server, api_key = token))

  server_version = client$server_settings()$version
  audit_server_version(server_version = server_version)
  return(server_version)
}

audit_server_version = function(server_version) {
  connect_versions = get_connect_versions()
  row_number = lookup_version(connect_versions, server_version)

  if (is.na(row_number)) {
    cli::cli_alert_info("Server version not in the DB")
    cli::cli_alert_info("Please report.")
  } else if (row_number > 1L) {
    newer_versions = connect_versions[seq_len(row_number - 1), ]
    no_of_versions = length(unique(newer_versions$version)) #nolint
    cli::cli_alert_info("Your server is {cli::col_red('out of date')}")
    cli::cli_alert_info("There are {cli::col_red(no_of_versions)} newer versions that fix \\
                      {cli::col_red(nrow(newer_versions))} CVEs")
  } else {
    cli::cli_alert_info("Your server is up to date")
  }
  return(invisible(NULL))
}

get_connect_versions = function() {
  versions = system.file("extdata", "connect_versions", "connect_versions.csv",
                         mustWork = TRUE, package = "jrHealthCheckConnect")
  versions = utils::read.csv(versions, comment.char = "#")
  versions$date = as.Date(versions$date)
  versions = dplyr::tibble(versions)

  versions = dplyr::arrange(versions, dplyr::desc(date))
  stopifnot("Error retrieving RSC versions " = nrow(versions) > 10)
  return(versions)
}

lookup_version = function(connect_versions, server_version) {
  version_as_date = version_to_date(server_version)
  if (is.na(version_as_date) || version_as_date < min(connect_versions$date)) {
    # Older than DB
    row_number = nrow(connect_versions) + 1
  } else if (version_as_date > max(connect_versions$date)) {
    # Newer than DB
    row_number = 1L
  } else {
    # Return matching version; multiple CVEs, so just pick 1
    # Rtns an NA when not in the DB
    row_number = which(connect_versions$version == server_version)[1]
  }
  return(row_number)
}

version_to_date = function(version) {
  # Old style version
  if (!is_new_version(version)) return(NA)
  as_date = stringr::str_match_all(version, "^(202[0-9])\\.([01][0-9])")[[1]]
  as.Date(paste(as_date[1, 2], as_date[1, 3], "01", sep = "-"))
}

# Old style versions are 1.9.0 (2021-07)
is_new_version = function(version) {
  stringr::str_detect(version, pattern = "^202[0-9]\\.[01][0-9].[0-9]")
}
