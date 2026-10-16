#' Deploy Python output
#'
#' @param python_dir Location of python deployment files
#' @param python_files An app, a qmd file or a notebook
#' @param rsconnect_type Type of deployment
#' @inheritParams check
#' @details Python deploy function
#' All python content must have a requirements.txt file and either a app.py, index.qmd or
#' hash.ipynb. `index.qmd` is for quarto only, and `hash.ipynb` for voila only.
#' General idea is to
#'  * copy dir of contents to R_TMP_DIR
#'  * Use the python interface to deploy
#'  * Clean up, finding the content on Connect by its title.
#'  @noRd
deploy_python = function(
  python_dir,
  python_files = c("app.py", "index.qmd", "hash.ipynb"),
  rsconnect_type = c("api", "streamlit", "quarto", "voila"),
  debug_level
) {
  suppress = get_suppress(debug_level)
  rsconnect_type = match.arg(rsconnect_type)
  tmp_dir = file.path(tempdir(), paste0("UAT_python-", rsconnect_type))
  title = paste("UAT: Python", rsconnect_type, Sys.Date(), sep = "-")
  # Connect creates the content before the deploy can fail, so clean up by title
  on.exit(cleanup_python(tmp_dir, debug_level, title = title))
  dir.create(tmp_dir, showWarnings = FALSE)

  # All py deploys have req.txt
  python_files = c(match.arg(python_files), "requirements.txt")
  file.copy(file.path(python_dir, python_files), tmp_dir)
  # Without a version constraint, rsconnect asks Connect for the auditor's own Python,
  # which the server may not have. This lets Connect pick any Python 3.10 or later.
  writeLines(
    c("[project]", 'name = "uat-python"', 'version = "0.0.0"', 'requires-python = ">=3.10"'),
    file.path(tmp_dir, "pyproject.toml")
  )
  has_deployed = suppress(
    processx::run(
      get_rsconnect_path(),
      args = c(
        "deploy",
        rsconnect_type,
        # Quarto and Voila deploy a document; the apps deploy the directory
        if (grepl("\\.(qmd|ipynb)$", python_files[1])) python_files[1] else ".",
        "--new",
        "--title",
        title
      ),
      wd = tmp_dir,
      # Not as arguments, which other users on the machine can read with ps
      env = c("current", CONNECT_SERVER = get_server(), CONNECT_API_KEY = get_token())
    )
  )
  invisible(has_deployed$status == 0)
}

cleanup_python = function(tmp_dir, debug_level, title) {
  if (debug_level == 2) {
    return(NULL)
  }
  suppress = get_suppress(debug_level)
  fs::dir_delete(tmp_dir)
  # fmt: skip
  con = suppress( # nolint
    connectapi::connect(
      server = get_server(),
      api_key = get_token()
    )
  )
  delete_content_by_title(con, title, suppress)
  invisible(NULL)
}

# For deploys that fail before they say what they created
delete_content_by_title = function(con, title, suppress) {
  # Only the auditor's content, so nobody else's item with the same title is deleted
  content = suppress(connectapi::get_content(con, owner_guid = con$me()$guid))
  guid = content$guid[content$title %in% title]
  # map in case we make multiple mistakes
  purrr::map(
    guid,
    ~ {
      item = connectapi::content_item(con, .x)
      suppress(connectapi::content_delete(item, force = TRUE))
    }
  )
  invisible(NULL)
}

# Log the check as skipped, so the report lists it, when rsconnect-python is missing
skip_without_rsconnect_python = function(check) {
  if (!isFALSE(.connect$rsconnect_python)) {
    return(FALSE)
  }
  cli::cli_alert_info("rsconnect-python missing. Skipping Python test.")
  check$start_logger()
  check$stop_logger(NA)
  TRUE
}
