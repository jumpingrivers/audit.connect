publish_rmd_as_html = function(input_rmd_name_in_extdata, deploy_name) {
  #Create a temporary directory. tempdir() creates a directory unique to this
  # session
  tmp_dir = tempdir()
  # The filepath where our example document is stored:
  rmd_filepath = system.file("extdata",
                             input_rmd_name_in_extdata,
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
    connectapi::deploy(bundle, name = deploy_name) %>%
    connectapi::poll_task()
  return(invisible(TRUE))
}

publish_rmd_as_static_bundle = function(input_rmd_name_in_extdata, deploy_name) {
  # This function uses connectapi::bundle_static instead of connectapi::bundle_dir

  # Construct the filepath to the .Rmd file we're interested in deploying.
  # This file can have YAML parameters at the top which specify the default file
  # output type. Connect will attempt to knit/compile the file on the server,
  # if needed, even if the output type is HTML/PDF/Word.
  rmd_filepath = system.file("extdata",
                             input_rmd_name_in_extdata,
                             package = "connecttest",
                             mustWork = TRUE)

  # Creates a connection to RStudio Connect using the server URL and an api key.
  # These are specified as CONNECT_API_KEY and CONNECT_SERVER in a file like ~/.Renviron
  # Also, validates the connection and checks that the version of the server is
  # compatible with the current version of the package:
  client = connectapi::connect()
  # rmd_filepath is a single file, so we don't have to worry about any unneeded
  # files being present in that directory:
  bundle = connectapi::bundle_static(rmd_filepath)
  on.exit(connectapi::content_delete(content, force = TRUE))

  # This deploys the content and waits for information about the deployment:
  content = client %>%
    connectapi::deploy(bundle, name = deploy_name) %>%
    connectapi::poll_task()
  return(invisible(TRUE))
}
