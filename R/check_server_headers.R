check_server_headers = function() {
  res = try(serverHeaders::check(get_server(clean = TRUE)), silent = TRUE)
  if ("try-error" %in% class(res))  {
    cli::cli_alert_warning("Attempt to reach server using {cli::col_red('http')} failed.")
    cli::cli_alert_info("Trying again using {cli::col_blue('https')}")
    res = serverHeaders::check(get_server())
  }
  return(res)
}
