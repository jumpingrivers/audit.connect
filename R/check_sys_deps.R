#' Checking System Dependencies
#'
#' Many R packages require additional system dependencies.
#' This check, obtains a list of system libraries installed on the connect server, then
#' determines which R packages can't be installed.
#' @noRd
check_sys_deps = function(debug_level = 0:2) {
  debug_level = get_debug_level(debug_level)
  suppress = get_suppress(debug_level)
  .connect$timezone = NULL

  app_dir = file.path(tempdir(), "pkg")
  pkg_dir = system.file(
    "extdata",
    "check_sys_deps",
    package = "audit.connect",
    mustWork = TRUE
  )
  fs::dir_copy(pkg_dir, app_dir, overwrite = TRUE)
  on.exit(cleanup_plumber(app_dir, content, debug_level))
  content = try(
    setup_plumber_sys_deps_endpoint(app_dir, debug_level),
    silent = TRUE
  )
  # Poll here, so a failed build still leaves content for cleanup_plumber() to delete
  built = content
  if (!inherits(content, "try-error")) {
    built = try(suppress(connectapi::poll_task(content)), silent = TRUE)
  }
  if (inherits(built, "try-error")) {
    cli::cli_alert_info("Can't deploy plumber end point - odd?")
    cli::cli_alert_info("Check the logs on {get_server()}")
    cli::cli_alert_info(
      "In the past, it was due to a missing sodium linux dependency"
    )
    return(NA)
  }

  # Ping endpoint
  url = paste0(get_deploy_url(content), "installed")
  auth_key = paste0("Key ", get_token())
  resp = httr::GET(url, httr::add_headers(Authorization = auth_key), httr::timeout(120))
  if (httr::http_error(resp)) {
    cli::cli_warn(
      "Can't check system libraries: the endpoint returned {httr::http_status(resp)$message}"
    )
    return(NA)
  }
  # An unsupported OS or an unexpected reply warns, so the deployment checks still run
  tryCatch(
    {
      rtn = jsonlite::parse_json(rawToChar(resp$content))
      # Read by check_connect_timezone(), as the endpoint is the only code that runs on Connect
      .connect$timezone = unlist(rtn$timezone)
      os_release = unlist(rtn$os_release)
      libs = unlist(rtn$libs)
      clean_libs = audit.base::clean_libs(os_release, libs)
      # clean_libs() has warned that it can't read the package list
      if (anyNA(clean_libs)) {
        return(NA)
      }
      audit.base::check_sys_deps(os_release, clean_libs, debug_level)
    },
    error = function(e) {
      cli::cli_warn(c("Can't check system libraries", "x" = conditionMessage(e)))
      NA
    }
  )
}

setup_plumber_sys_deps_endpoint = function(app_dir, debug_level) {
  suppress = get_suppress(debug_level)
  # Deploy plumber
  client = suppress(connectapi::connect(
    server = get_server(),
    api_key = get_token()
  ))
  bundle = suppress(connectapi::bundle_dir(app_dir))
  name = paste("UAT_check_package-", Sys.Date(), sep = "_")
  suppress(connectapi::deploy(client, bundle, name = name))
}

# Extracting the URL differs on first deployment and subsequent deployments
get_deploy_url = function(content) {
  url = content$get_url()
  if (is.null(url)) {
    url = content$get_content()$url
  }
  if (is.null(url)) {
    stop("Missing deploy url")
  }
  url
}

# TRUE if the Connect server's timezone is set, FALSE if not, NA if we couldn't find out
check_connect_timezone = function() {
  cli::cli_h2("Timezone")
  timezone = .connect[["timezone"]]
  if (is.null(timezone)) {
    cli::cli_alert_info("Couldn't read the Connect server's timezone")
    return(invisible(NA))
  }
  if (nzchar(timezone)) {
    cli::cli_alert_success("Timezone set: {timezone}")
    return(invisible(TRUE))
  }
  cli::cli_alert_danger("Timezone not set on the Connect server")
  invisible(FALSE)
}
