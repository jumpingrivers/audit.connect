deploy_plumber = function(plumber_dir, suppress = suppressMessages) {

  app_dir = file.path(tempdir(), "uat-plumber")
  fs::dir_copy(plumber_dir, app_dir)
  on.exit(cleanup_plumber(app_dir, content, suppress))

  client = suppress(connectapi::connect(server = get_server(), api_key = get_token()))
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

  return(invisible(check_response))
}

cleanup_plumber = function(bundle_dir, content, suppress) {
  if (exists("content")) suppress(connectapi::content_delete(content, force = TRUE))
  fs::dir_delete(bundle_dir)
}
