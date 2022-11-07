
set_key = function(name, value) {
  .connect[[name]] = value
  return(invisible(value))
}

get_server = function() .connect[["connect_server"]]

get_token = function() .connect[["connect_api_key"]]

get_value = function(env_name, value = NULL) {
  if (is.null(value)) value = Sys.getenv(env_name, NA)
  return(value)
}
