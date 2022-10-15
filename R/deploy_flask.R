deploy_flask = function(python_dir, suppress = suppressMessages) {
  tmp_dir = file.path(tempdir(), "python")
  on.exit(cleanup_flask(tmp_dir))
  dir.create(tmp_dir, showWarnings = FALSE)
  file.copy(file.path(python_dir, c("app.py", "requirements.txt")), tmp_dir)
  title = paste0("Python-flask-", Sys.Date())
  has_deployed = suppress(
    processx::run("rsconnect",
                  args = c("deploy", "api",
                           "--server", Sys.getenv("CONNECT_SERVER"),
                           "--api-key", Sys.getenv("CONNECT_API_KEY"),
                           "--new",
                           "--title", title,
                           tmp_dir)))

  content = processx::run("rsconnect",
                          args = c("content", "search",
                                   "--server", Sys.getenv("CONNECT_SERVER"),
                                   "--api-key", Sys.getenv("CONNECT_API_KEY"),
                                   "--content-type", "python-api",
                                   "--title-contains", title))
  guid = jsonlite::fromJSON(content$stdout)$guid
  # Redoing on.exit to clean-up content
  on.exit(cleanup_flask(tmp_dir, guid = guid))
  return(invisible(has_deployed$status == 0))
}

cleanup_flask = function(tmp_dir, guid = NULL) {
  fs::dir_delete(tmp_dir)
  # map in case we make multiple mistakes
  if (!is.null(guid)) {
    purrr::map(guid, jrApiRStudio::delete_content)
  }
  return(invisible(NULL))
}
