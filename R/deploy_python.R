#' Deploy Python output
#'
#' All python content must have a requirements.txt file and either a app.py or index.qmd.
#' `index.qmd` is for quarto only. General idea is to
#'  * copy dir of contents to R_TMP_DIR
#'  * Use the python interface to deploy
#'  * Use the python interface to grab the guid
#'  * Clean up.
#'  @noRd
deploy_python = function(python_dir,
                         python_files = c("app.py", "index.qmd"),
                         suppress = suppressMessages,
                         rsconnect_type = c("api", "streamlit", "quarto")) {
  rsconnect_type = match.arg(rsconnect_type)
  tmp_dir = file.path(tempdir(), paste0("python-", rsconnect_type))
  on.exit(cleanup_python(tmp_dir))
  dir.create(tmp_dir, showWarnings = FALSE)

  # All py deploys have req.txt
  python_files = c(match.arg(python_files), "requirements.txt")
  file.copy(file.path(python_dir, python_files), tmp_dir)
  title = paste("UAT: Python", rsconnect_type, Sys.Date(), sep = "-")
  has_deployed = suppress(
    processx::run("rsconnect",
                  args = c("deploy",
                           rsconnect_type,
                           ifelse("index.qmd" %in% python_files, "index.qmd", "."),
                           "--server", get_server(),
                           "--api-key", get_token(),
                           "--new",
                           "--title", title),
                  wd = tmp_dir))

  content = processx::run("rsconnect",
                          args = c("content", "search",
                                   "--server", get_server(),
                                   "--api-key", get_token(),
                                   "--title-contains", title),
                          wd = tmp_dir)
  guid = jsonlite::fromJSON(content$stdout)$guid

  # Redoing on.exit to clean-up content
  on.exit(cleanup_python(tmp_dir, guid = guid))
  return(invisible(has_deployed$status == 0))
}

cleanup_python = function(tmp_dir, guid = NULL) {
  fs::dir_delete(tmp_dir)
  # map in case we make multiple mistakes
  con = suppressMessages(connectapi::connect(server = get_server(), api_key = get_token())) #nolint
  purrr::map(guid, ~{
    item = connectapi::content_item(con, .x)
    suppressMessages(connectapi::content_delete(item, force = TRUE))
  })

  return(invisible(NULL))
}
