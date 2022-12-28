deploy_plumber = function(plumber_dir, suppress = suppressMessages) {

  app_dir = file.path(tempdir(), "plumber")
  fs::dir_copy(plumber_dir, app_dir)
  on.exit(cleanup_plumber(app_dir, content, suppress))

  client = suppress(connectapi::connect())
  bundle = suppress(connectapi::bundle_dir(app_dir))

  # If deploy not successful, content not created
  name = paste("UAT_Plumber-", Sys.Date(), sep = "_")
  content = suppress(connectapi::deploy(client, bundle, name = name))

  suppress(connectapi::poll_task(content))

  # Ping echo
  url = paste0(content$get_url(), "echo?msg=testing")
  auth_key = paste0("Key ", get_token())
  resp = httr::GET(url, httr::add_headers(Authorization = auth_key))
  check_response = grepl(pattern = "testing", rawToChar(resp$content))

  return(invisible(check_response))
}

cleanup_plumber = function(bundle_dir, content, suppress) {
  if (exists("content")) suppress(connectapi::content_delete(content, force = TRUE))
  fs::dir_delete(bundle_dir)
}
