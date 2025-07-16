summarise_versions = function(server, token) {
  cli::cli_h2("R/Python/Quarto Versions")
  software = c("r", "python", "quarto")

  installed = purrr::map_dfr(software, ~ get_server_settings(server, token, .x))
  installed = audit.base::augment_installed(installed)

  installed
}

get_server_settings = function(
  server,
  token,
  type = c("r", "python", "quarto")
) {
  type = match.arg(type)
  res = httr::GET(
    paste0(server, "__api__/v1/server_settings/", type),
    httr::add_headers(Authorization = paste("Key", token))
  )
  content = httr::content(res)
  purrr::map_dfr(
    content$installations,
    ~ tibble::tibble(software = type, installed_version = .x$version)
  )
}
