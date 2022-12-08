set_key = function(name, value) {
  .connect[[name]] = value
  return(invisible(value))
}

get_server = function(clean = FALSE) {
  server = .connect[["connect_server"]]
  if (is.null(server)) cli::cli_abort("Missing server")
  if (clean) server = stringr::str_remove_all(server, "http?s|:|/")
  return(server)
}

get_token = function() .connect[["connect_api_key"]]

get_username = function() .connect[["username"]]

get_value = function(env_name, value = NULL) {
  if (is.null(value)) value = Sys.getenv(env_name, NA)
  return(value)
}
