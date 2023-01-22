deploy_quarto = function(quarto_dir, account, suppress = suppressMessages) {
  tmp_dir = file.path(tempdir(), "quarto")
  on.exit(cleanup_quarto(tmp_dir))
  dir.create(tmp_dir, showWarnings = FALSE)

  file.copy(file.path(quarto_dir, "index.qmd"), tmp_dir)
  title = paste("UAT: Quarto", Sys.Date())
  # quarto uses rsconnect::accounts. So, looks up the server in list of accounts
  has_deployed = suppress(quarto::quarto_publish_doc(file.path(tmp_dir, "index.qmd"),
                             render = "server",
                             title = title,
                             server = get_server(clean = TRUE),
                             account = account,
                             launch.browser = FALSE,
                             forceUpdate = TRUE,
                             logLevel = "quiet"))
  return(invisible(has_deployed))
}

cleanup_quarto = function(tmp_dir) {
  fnames = list.files(tmp_dir, recursive = TRUE, full.names = TRUE)
  dcf = fnames[stringr::str_detect(fnames, "(.*)\\.dcf$")]
  dcf_contents = read.dcf(dcf)
  url = dcf_contents[1, "url"]
  guid = stringr::str_match_all(url, "content/(.*)/")[[1]][, 2]
  con = suppressMessages(connectapi::connect(server = get_server(), api_key = get_token()))
  item = connectapi::content_item(con, guid = guid)
  suppressMessages(connectapi::content_delete(item, force = TRUE))
  fs::dir_delete(tmp_dir)
}
