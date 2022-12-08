# if the server exists, everything still works
register_uat_user = function(server, token, account) {
  clean_url = get_server(clean = TRUE)
  rsconnect::addServer(paste0(server, "__api__"), name = clean_url, quiet = TRUE)

  rsconnect::connectApiUser(
    server = clean_url,
    account = account,
    apiKey = token,
    quiet = TRUE)

  return(invisible(NULL))
}
