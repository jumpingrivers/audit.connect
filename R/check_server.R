check_server_version = function(server, token) {
  cli::cli_h2("Checking Server Version")
  con = suppressMessages(connectapi::connect(server = server, api_key = token))

  server_version = con$server_settings()$version
  connect_versions = get_connect_versions()
  row_number = which.max(connect_versions$version == server_version)

  # Server version missing from the database
  if (length(row_number) == 0L) row_number = nrow(connect_versions) + 1

  # Server is up to date
  if (row_number == 1L) {
    cli::cli_alert_info("Your server is up to date")
    return(NULL)
  }

  newer_versions = connect_versions[seq_len(row_number - 1), ]
  no_of_versions = length(unique(newer_versions$version)) #nolint
  cli::cli_alert_info("Your server is {cli::col_red('out of date')}")
  cli::cli_alert_info("There are {cli::col_red(no_of_versions)} newer versions that fix \\
                      {cli::col_red(nrow(connect_versions))} CVEs")
}

get_connect_versions = function() {
  versions = system.file("extdata", "connect_versions", "connect_versions.csv",
                         mustWork = TRUE, package = "jrHealthCheckConnect")
  versions = utils::read.csv(versions)
  versions$date = as.Date(versions$date)
  versions = dplyr::tibble(versions)

  versions = dplyr::arrange(versions, dplyr::desc(date))
  stopifnot("Error retrieving RSC versions " = nrow(versions) > 10)
  return(versions)
}
