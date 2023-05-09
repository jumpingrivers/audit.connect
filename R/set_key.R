set_key = function(name, value) {
  .connect[[name]] = value
  if (is.null(value) || nchar(value) == 0L) {
    error_msg = paste0("Missing ", name)
    stop(error_msg, call. = FALSE)
  }
  return(invisible(value))
}

get_account = function() {
  account = .connect[["connect_account"]]
  account
}
get_server = function(clean = FALSE) {
  server = .connect[["connect_server"]]
  if (is.null(server)) {
    server = get_value("CONNECT_SERVER")
    set_key("connect_server", server)
  }
  if (is.null(server)) cli::cli_abort("Missing server")
  if (clean) server = stringr::str_remove_all(server, "https?|:|/")
  return(server)
}

get_token = function() {
  token = .connect[["connect_api_key"]]
  if (is.null(token)) {
    token = get_value("CONNECT_API_KEY")
    set_key("connect_api_key", token)
  }
  if (is.null(token)) stop("Can't find CONNECT_API_KEY")
  return(token)
}

get_username = function() {
  user = .connect[["username"]]
  if (is.null(user)) stop("Can't find username")
  return(user)
}

get_value = function(env_name, value = NULL) {
  if (is.null(value) || nchar(value) == 0L) value = Sys.getenv(env_name, NA)
  return(value)
}
