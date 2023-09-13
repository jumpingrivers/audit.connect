deploy_quarto = function(quarto_dir, account = NULL, debug_level = debug_level) {
  suppress = get_suppress(debug_level)

  tmp_dir = file.path(tempdir(), "quarto")
  on.exit(cleanup_quarto(tmp_dir, debug_level))
  dir.create(tmp_dir, showWarnings = FALSE)

  file.copy(file.path(quarto_dir, "index.qmd"), tmp_dir)
  title = paste("UAT: Quarto", Sys.Date())
  # quarto uses rsconnect::accounts. So, looks up the server in list of accounts
  if (is.null(account)) account = get_account()


  has_deployed = suppress(
    rsconnect::deployApp(appDir = tmp_dir,
                         appPrimaryDoc = NULL,
                         appSourceDoc = file.path(tmp_dir, "index.qmd"),
                         appFiles = "index.qmd",
                         appName = NULL,
                         appTitle = title,
                         account = account,
                         server = get_server(clean = TRUE),
                         forceUpdate = TRUE,
                         logLevel = "quiet",
                         launch.browser = FALSE)
  )




  # has_deployed = suppress(quarto::quarto_publish_doc(file.path(tmp_dir, "index.qmd"),
  #                                                    render = "server",
  #                                                    title = title,
  #                                                    server = get_server(clean = TRUE),
  #                                                    account = account,
  #                                                    launch.browser = FALSE,
  #                                                    forceUpdate = TRUE,
  #                                                    logLevel = "quiet"))
  return(invisible(has_deployed))
}

cleanup_quarto = function(tmp_dir, debug_level) {
  if (debug_level == 2) return(NULL)
  suppress = get_suppress(debug_level)
  fnames = list.files(tmp_dir, recursive = TRUE, full.names = TRUE)
  dcf = fnames[stringr::str_detect(fnames, "(.*)\\.dcf$")]
  dcf_contents = read.dcf(dcf)
  url = dcf_contents[1, "url"]
  guid = stringr::str_match_all(url, "content/(.*)/")[[1]][, 2]
  con = suppress(connectapi::connect(server = get_server(), api_key = get_token()))
  item = connectapi::content_item(con, guid = guid)
  suppress(connectapi::content_delete(item, force = TRUE))
  fs::dir_delete(tmp_dir)
}
