publish_markdown_document = function() {
  #Create a temporary directory. tempdir() creates a directory unique to this
  # session
  tmp_dir = tempdir()
  # The filepath where our example document is stored:
  rmd_filepath = system.file("extdata",
                             "test-rmd-document.Rmd",
                             package = "connecttest",
                             mustWork = TRUE)
  # XXX: Now copy example Rmd file from inst/ to tmp_dir:
  file.copy(rmd_filepath, tmp_dir)

  #Write manifest.json, but also some extra .rds files:
  rsconnect::writeManifest(tmp_dir)

  # Creates a connection to RStudio Connect using the server URL and an api key.
  # These are specified as CONNECT_API_KEY and CONNECT_SERVER in a file like ~/.Renviron
  # Also, validates the connection and checks that the version of the server is
  # compatible with the current version of the package:
  client = connectapi::connect()

  #Creates a bundle from the target directory:
  bundle = connectapi::bundle_dir(tmp_dir)

  # This will clean up the content from Connect. on.exit will lead to the
  # enclosed expression being executed when the current function exits
  # (either naturally, or as a result of an error).
  on.exit(connectapi::content_delete(content, force = TRUE))

  # This deploys the content and waits for information about the deployment:
  content = client %>%
    connectapi::deploy(bundle, name = "uat-rmd-test") %>%
    connectapi::poll_task()
  return(invisible(TRUE))
}
