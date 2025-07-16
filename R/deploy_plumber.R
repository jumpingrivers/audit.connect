deploy_plumber = function(plumber_dir, debug_level) {
  suppress = get_suppress(debug_level)
  app_dir = file.path(tempdir(), "uat-plumber")
  fs::dir_copy(plumber_dir, app_dir)
  on.exit(cleanup_plumber(app_dir, content, debug_level))

  client = suppress(connectapi::connect(
    server = get_server(),
    api_key = get_token()
  ))
  bundle = suppress(connectapi::bundle_dir(app_dir))

  # If deploy not successful, content not created
  title = paste("UAT: Plumber", Sys.time())
  content = suppress(connectapi::deploy(client, bundle, title = title))

  suppress(connectapi::poll_task(content))

  # Ping echo
  url = paste0(content$get_url(), "echo?msg=testing")
  auth_key = paste0("Key ", get_token())
  resp = httr::GET(url, httr::add_headers(Authorization = auth_key))
  check_response = grepl(pattern = "testing", rawToChar(resp$content))

  invisible(check_response)
}

cleanup_plumber = function(bundle_dir, content, debug_level) {
  suppress = get_suppress(debug_level)
  if (debug_level == 2) {
    return(NULL)
  }
  if (exists("content") && "Connect" %in% class(content)) {
    suppress(connectapi::content_delete(content, force = TRUE))
  }
  fs::dir_delete(bundle_dir)
}
