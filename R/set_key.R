set_key = function(name, value) {
  .connect[[name]] = value
  if (is.null(value) || nchar(value) == 0L) {
    error_msg = paste0("Missing ", name)
    stop(error_msg, call. = FALSE)
  }
  return(invisible(value))
}

get_server = function(clean = FALSE) {
  server = .connect[["connect_server"]]
  if (is.null(server)) cli::cli_abort("Missing server")
  if (clean) server = stringr::str_remove_all(server, "https?|:|/")
  return(server)
}

get_token = function() .connect[["connect_api_key"]]

get_username = function() .connect[["username"]]

get_value = function(env_name, value = NULL) {
  if (is.null(value)) value = Sys.getenv(env_name, NA)
  return(value)
}
