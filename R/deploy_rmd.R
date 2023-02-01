# utility functions for testing Rmd -> HTML|PDF|Doc deployment
deploy_rmd = function(rmd_dir, debug_level) {
  tmp_dir = tempdir()

  file.copy(rmd_dir, tmp_dir, recursive = TRUE)
  app_dir = file.path(tmp_dir, basename(rmd_dir))

  rsconnect::writeManifest(appDir = app_dir, appFiles = "index.Rmd")

  deploy_name = get_deploy_name(app_dir)
  push_to_connect(bundle_dir = app_dir, deploy_name = deploy_name, debug_level)

  return(invisible(TRUE))
}

get_deploy_name = function(rmd_path) {
  fname = basename(rmd_path)
  clean_string = stringr::str_remove_all(fname, "(\\.Rmd$|^test-)")
  paste("UAT: RMD deploy", clean_string)
}

push_to_connect = function(bundle_dir, deploy_name, debug_level) {
  suppress = get_suppress(debug_level)
  # Need: CONNECT_API_KEY and CONNECT_SERVER
  client = suppress(connectapi::connect(server = get_server(), api_key = get_token()))
  bundle = suppress(connectapi::bundle_dir(bundle_dir))

  # If deploy not successful, content not created
  content = suppress(connectapi::deploy(client, bundle, title = deploy_name))
  on.exit(cleanup_rmd(bundle_dir, content, debug_level))
  suppress(connectapi::poll_task(content))
  return(invisible(NULL))
}

cleanup_rmd = function(bundle_dir, content, debug_level) {
  if (debug_level == 2) return(invisible(NULL))
  suppress = get_suppress(debug_level)
  if (exists("content")) suppress(connectapi::content_delete(content, force = TRUE))
  fs::dir_delete(bundle_dir)
}
