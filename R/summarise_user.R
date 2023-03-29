summarise_user = function(server, token) {
  cli::cli_h2("User Summary")
  res = httr::GET(paste0(server, "/__api__/v1/user"),
                  httr::add_headers(Authorization = paste("Key", token)))
  check_api_status_code(res)
  content = httr::content(res)
  cli::cli_alert_info("{content$first_name} {content$last_name} <{content$email}>")
  cli::cli_alert_info("Username: {content$username}")
  cli::cli_alert_info("Role: {content$user_role}")
  set_key("username", content$username)
  set_key("connect_account", content$username)
  return(invisible(content))
}

check_api_status_code = function(res) {
  status = res$status_code
  if (!(stringr::str_starts(status, "1|2"))) {
    cli::cli_alert_danger("Bad server status code")
    cli::cli_alert_danger("Likely causes are: bad token or bad server URL")
    cli::cli_alert_danger("{res$url} has status code {status}")
    cli::cli_alert_danger("{httr::http_status(status)$message}")
    cli::cli_abort("Status code: {status}")
  }
  return(invisible(NULL))
}
