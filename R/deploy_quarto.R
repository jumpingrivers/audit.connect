deploy_quarto = function(
  quarto_dir,
  account = NULL,
  debug_level
) {
  suppress = get_suppress(debug_level)

  tmp_dir = file.path(tempdir(), "quarto", basename(quarto_dir))
  title = paste("UAT: Quarto", Sys.Date())
  on.exit(cleanup_quarto(tmp_dir, debug_level, title = title))
  dir.create(tmp_dir, showWarnings = FALSE)
  fs::dir_copy(quarto_dir, tmp_dir, overwrite = TRUE)
  # quarto uses rsconnect::accounts. So, looks up the server in list of accounts
  if (is.null(account)) {
    account = get_account()
  }
  has_deployed = suppress(quarto::quarto_publish_doc(
    file.path(tmp_dir, "index.qmd"),
    render = "server",
    title = title,
    server = get_server(clean = TRUE),
    account = account,
    launch.browser = FALSE,
    forceUpdate = TRUE,
    logLevel = "quiet"
  ))
  invisible(has_deployed)
}

cleanup_quarto = function(tmp_dir, debug_level, title) {
  if (debug_level == 2) {
    return(NULL)
  }
  on.exit(fs::dir_delete(tmp_dir))
  suppress = get_suppress(debug_level)
  con = suppress(connectapi::connect(
    server = get_server(),
    api_key = get_token()
  ))
  fnames = list.files(tmp_dir, recursive = TRUE, full.names = TRUE)
  dcf = fnames[stringr::str_detect(fnames, "(.*)\\.dcf$")]
  # quarto_publish_doc() writes the deployment record only once the deploy succeeds
  if (length(dcf) == 0L) {
    return(delete_content_by_title(con, title, suppress))
  }
  dcf_contents = read.dcf(dcf)
  url = dcf_contents[1, "url"]
  guid = stringr::str_match_all(url, "content/(.*)/")[[1]][, 2]
  item = connectapi::content_item(con, guid = guid)
  suppress(connectapi::content_delete(item, force = TRUE))
}
