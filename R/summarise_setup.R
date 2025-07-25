# Note: storing variables in .connect as in the (near) future, we'll want to pass
# keys / servers as variables
summarise_setup = function(server, token) {
  cli::cli_h2("Summary audit.connect v{packageVersion('audit.connect')}")
  setup = list()
  setup$server = check_server(server)
  setup$api_key = check_api_key(token)
  setup$rsconnect_python = check_rsconnect_python()
  invisible(setup)
}

check_server = function(server) {
  server = get_value("CONNECT_SERVER", server)
  server = standardise_server_url(server)
  server = set_key("connect_server", get_value("CONNECT_SERVER", server))
  check_server_accessibility(server)
  invisible(server)
}

# The server structure is really picky: we are using {rsconnect}, {connectapi}, python deployment
# Solution: enforce one URL structure
# This pkg likely won't work if the url is https://example.com/myrsc/
# But I don't have that structure to test, so ...
standardise_server_url = function(server) {
  if (is.na(server)) {
    cli::cli_abort(
      "Can't find server. \\
                   Either add CONNECT_SERVER to your .Renviron or
                   pass `server` as an argument"
    )
  }
  end_slash = stringr::str_ends(server, pattern = "/")
  if (isFALSE(end_slash)) {
    server = paste0(server, "/")
  }

  # We need to enforce adding http, otherwise things get messy. E.g.
  # APIs typically need SSL, but if we only have http, that's "OK" to use http.
  # But if we try http, and https is needed, it fails.
  start_address = stringr::str_starts(server, pattern = "http")
  if (isFALSE(start_address)) {
    cli::cli_abort("Please add https (or http) to the server URL.")
  }
  cli::cli_alert_info("Server: {cli::col_green(server)}")
  invisible(server)
}

check_server_accessibility = function(server) {
  resp = try(httr::GET(server), silent = TRUE)
  if (inherits(resp, "try-error")) {
    cli::cli_abort("Can not access {server}")
  }
  check_api_status_code(resp)
  cli::cli_alert_info("Server accessible: {cli::col_green(cli::symbol$tick)}")
}

check_api_key = function(token) {
  value = set_key("connect_api_key", get_value("CONNECT_API_KEY", token))
  if (is.na(value)) {
    cli::cli_abort("CONNECT_API_KEY missing")
  }
  cli::cli_alert_info("API KEY: {cli::col_green(cli::symbol$tick)}")
  invisible(TRUE)
}

check_rsconnect_python = function() {
  value = set_key(
    "rsconnect_python",
    as.logical(nchar(Sys.which("rsconnect")) > 0)
  )
  sym = ifelse(
    value,
    cli::col_green(cli::symbol$tick),
    cli::col_red(cli::symbol$cross)
  ) #nolint
  cli::cli_alert_info("rsconnect-python: {sym}")
  if (isFALSE(value)) {
    cli::cli_alert_warning("rsconnect-python not installed")
    cli::cli_alert_warning("All python deploy tests will be skipped")
    cli::cli_alert_warning("Install: pip install rsconnect-python")
  }
  invisible(value)
}
