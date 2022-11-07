deploy_python = function(python_dir,
                         suppress = suppressMessages,
                         rsconnect_type = c("api", "streamlit")) {
  rsconnect_type = match.arg(rsconnect_type)
  tmp_dir = file.path(tempdir(), "python")
  on.exit(cleanup_python(tmp_dir))
  dir.create(tmp_dir, showWarnings = FALSE)
  file.copy(file.path(python_dir, c("app.py", "requirements.txt")), tmp_dir)
  title = paste("Python", rsconnect_type, Sys.Date(), sep = "-")
  has_deployed = suppress(
    processx::run("rsconnect",
                  args = c("deploy",
                           rsconnect_type,
                           "--server", get_server(),
                           "--api-key", get_token(),
                           "--new",
                           "--title", title,
                           tmp_dir)))

  content = processx::run("rsconnect",
                          args = c("content", "search",
                                   "--server", get_server(),
                                   "--api-key", get_token(),
                                   "--title-contains", title))
  guid = jsonlite::fromJSON(content$stdout)$guid
  # Redoing on.exit to clean-up content
  on.exit(cleanup_python(tmp_dir, guid = guid))
  return(invisible(has_deployed$status == 0))
}

cleanup_python = function(tmp_dir, guid = NULL) {
  fs::dir_delete(tmp_dir)
  # map in case we make multiple mistakes
  if (!is.null(guid)) {
    purrr::map(guid, ~jrApiRStudio::delete_content(.x, server = get_server(), token = get_token()))
  }
  return(invisible(NULL))
}
