# Note: storing variables in .connect as in the (near) future, we'll want to pass
# keys / servers as variables
summarise_setup = function() {
  cli::cli_h2("Summary jrHealthCheckConnect v{packageVersion('jrHealthCheckConnect')}")
  check_server()
  check_api_key()
  check_rsconnect_python()
  return(invisible(NULL))
}

check_server = function() {
  server = set_key("connect_server", Sys.getenv("CONNECT_SERVER", NA))
  if (is.na(server)) {
    cli::cli_abort("CONNECT_SERVER is missing")
  }
  cli::cli_alert_info("Server: {server}")

  resp = try(httr::GET(server), silent = TRUE)
  if (inherits(resp, "try-error")) {
    cli::cli_abort("Can not access {server}")
  }
  status_code = httr::status_code(resp)
  if (stringr::str_starts(status_code, "2", negate = TRUE)) {
    cli::cli_abort("Server status code is {status_code}")
  }
  cli::cli_alert_info("Server accessible: {cli::symbol$tick}")
  return(invisible(NULL))
}

check_api_key = function() {
  value = set_key("connect_api_key", Sys.getenv("CONNECT_API_KEY", NA))
  if (is.na(value)) {
    cli::cli_abort("CONNECT_API_KEY missing")
  }
  cli::cli_alert_info("API KEY: {cli::symbol$tick}")
  return(invisible(NULL))
}
check_rsconnect_python = function() {
  value = set_key("rsconnect_python", as.logical(nchar(Sys.which("rsconnect")) > 0))
  sym = ifelse(value, cli::symbol$tick, cli::symbol$cross) #nolint
  cli::cli_alert_info("rsconnect-python: {sym}")
  if (isFALSE(value)) {
    cli::cli_alert_warning("rsconnect-python not installed")
    cli::cli_alert_warning("All python deploy tests will be skipped")
    cli::cli_alert_warning("Install: pip install rsconnect-python")
  }
  return(invisible(NULL))
}

set_key = function(name, value) {
  .connect[[name]] = value
  return(invisible(value))
}
