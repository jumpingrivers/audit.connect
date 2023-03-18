deploy_git = function(repository, debug_level, title) {
  suppress = get_suppress(debug_level)

  client = suppress(connectapi::connect(server = get_server(), api_key = get_token()))
  content = suppress(connectapi::deploy_repo(client,
                                             repository,
                                             branch = "main",
                                             subdirectory = ".",
                                             title = "UAT")
  )

  # If deploy not successful, content not created
  on.exit(cleanup_app(bundle_dir = NULL, content, debug_level))
  suppress(connectapi::poll_task(content))

  return(invisible(TRUE))
}
