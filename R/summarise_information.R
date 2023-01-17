summarise_versions = function(server, token) {
  cli::cli_h2("R/Python/Quarto versions")

  r = get_info(server, token, "r") #nolint
  cli::cli_alert_info("R versions: {paste(r, collapse = ', ')}")

  python = get_info(server, token, "python")#nolint
  cli::cli_alert_info("Python versions: {paste(python, collapse = ', ')}")

  quarto = get_info(server, token, "quarto")#nolint
  cli::cli_alert_info("Quarto versions: {paste(quarto, collapse = ', ')}")
  return(list(r = r, python = python, quarto = quarto))
}

get_info = function(server, token, type = c("r", "python", "quarto")) {
  type = match.arg(type)
  res = httr::GET(paste0(server, "/__api__/v1/server_settings/", type),
                  httr::add_headers(Authorization = paste("Key", token)))
  content = httr::content(res)
  purrr::map_chr(content$installations, ~.x$version)
}
