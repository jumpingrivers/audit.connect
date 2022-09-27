# utility functions for testing Rmd -> HTML|PDF|Doc deployment
deploy_rmd = function(rmd_dir, suppress = suppressMessages) {
  tmp_dir = tempdir()
  on.exit(unlink(tmp_dir))

  file.copy(rmd_dir, tmp_dir, recursive = TRUE)
  app_dir = file.path(tmp_dir, basename(rmd_dir))

  rsconnect::writeManifest(appDir = app_dir, appFiles = "index.Rmd")

  deploy_name = get_deploy_name(app_dir)
  push_to_connect(bundle_dir = app_dir, deploy_name = deploy_name, suppress = suppress)

  return(invisible(TRUE))
}

get_deploy_name = function(rmd_path) {
  fname = basename(rmd_path)
  clean_string = stringr::str_remove_all(fname, "(\\.Rmd$|^test-)")
  paste0("test-uat-", clean_string)
}

push_to_connect = function(bundle_dir, deploy_name, suppress) {
  # Need: CONNECT_API_KEY and CONNECT_SERVER
  client = suppress(connectapi::connect())
  bundle = suppress(connectapi::bundle_dir(bundle_dir))

  # If deploy not successful, content not created
  content = suppress(connectapi::deploy(client, bundle, name = deploy_name))
  on.exit(if (exists("content")) suppress(connectapi::content_delete(content, force = TRUE)),
          add = TRUE)
  suppress(connectapi::poll_task(content))
  return(invisible(NULL))
}
