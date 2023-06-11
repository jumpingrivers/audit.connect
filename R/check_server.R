check_server_version = function(server, token, debug_level) {
  suppress = get_suppress(debug_level)
  cli::cli_h2("Checking Server Version")
  client = suppress(connectapi::connect(server = server, api_key = token))

  server_version = client$server_settings()$version
  audit.base::audit_server_version(server_version = server_version, type = "connect")
  return(server_version)
}
