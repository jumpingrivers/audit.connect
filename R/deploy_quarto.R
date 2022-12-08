deploy_quarto = function(quarto_dir, account, suppress = suppressMessages) {
  tmp_dir = file.path(tempdir(), "quarto")
  on.exit(cleanup_quarto(tmp_dir))
  dir.create(tmp_dir, showWarnings = FALSE)

  file.copy(file.path(quarto_dir, "index.qmd"), tmp_dir)
  # quarto uses rsconnect::accounts. So, looks up the server in list of accounts
  has_deployed = suppress(quarto::quarto_publish_doc(file.path(tmp_dir, "index.qmd"),
                             render = "server",
                             server = get_server(clean = TRUE),
                             account = account,
                             launch.browser = FALSE,
                             forceUpdate = TRUE,
                             logLevel = "quiet"))
  return(invisible(has_deployed))
}

cleanup_quarto = function(tmp_dir) {
  fnames = list.files(tmp_dir, recursive = TRUE, full.names = TRUE)
  dcf = fnames[stringr::str_detect(fnames, "/(.*)\\.dcf$")]
  dcf_contents = read.dcf(dcf)
  url = dcf_contents[1, "url"]
  guid = stringr::str_match_all(url, "content/(.*)/")[[1]][, 2]
  suppressMessages(jrApiRStudio::delete_content(guid, server = get_server(), token = get_token()))
  fs::dir_delete(tmp_dir)
}
