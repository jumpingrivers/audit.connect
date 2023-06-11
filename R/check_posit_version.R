check_posit_version = function(server, token, debug_level) {
  suppress = get_suppress(debug_level)
  cli::cli_h2("Checking Server Version")
  client = suppress(connectapi::connect(server = server, api_key = token))

  posit_version = client$server_settings()$version
  audit.base::audit_posit_version(posit_version = posit_version, type = "connect")
  return(posit_version)
}
