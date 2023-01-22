#' Checking System Dependencies
#'
#' Many R packages require additional system dependencies.
#' This check, obtains a list of system libraries installed on the connect server, then
#' determines which R packages can't be installed.
#' @param suppress Suppress output
#' @details Suppress parameter will be changed in a near-future MR to verbose levels
#' @export
check_sys_deps = function(suppress = suppressMessages) {
  cli::cli_h2("Systems Libraries")

  app_dir = file.path(tempdir(), "pkg")
  pkg_dir = system.file("extdata", "check_sys_deps", package = "jrHealthCheckConnect",
                        mustWork = TRUE)
  fs::dir_copy(pkg_dir, app_dir)
  on.exit(cleanup_plumber(app_dir, content, suppressMessages))
  content = setup_plumber_sys_deps_endpoint(app_dir, suppress)

  # Ping endpoint
  url = paste0(get_deploy_url(content), "installed")
  auth_key = paste0("Key ", get_token())
  resp = httr::GET(url, httr::add_headers(Authorization = auth_key))
  rtn = jsonlite::parse_json(rawToChar(resp$content))

  # Clean up response
  pkg_look_up = get_os_sys_deps(rtn$os)
  installed_sys_deps = stringr::str_match(rtn$libs, "^[^/]*")[, 1]

  # Determine which libs are missing
  missing_libs = pkg_look_up[!(pkg_look_up$sys_libs %in% installed_sys_deps), ]
  missing_libs = dplyr::arrange(missing_libs, .data$sys_libs, .data$r_pkg_names)
  cli::cli_alert_info("Unable to install {nrow(missing_libs)} CRAN packages")

  if (nrow(missing_libs) > 0) {
    sys_libs = unique(missing_libs$sys_libs) #nolint
    cli::cli_alert_info("Missing sys_libs: {sys_libs}")
    cli::cli_alert_info("Note: this is not necessarily a bad thing")
  }
  return(missing_libs)
}

setup_plumber_sys_deps_endpoint = function(app_dir, suppress = suppressMessages) { #nolint
  # Deploy plumber
  client = suppress(connectapi::connect(server = get_server(), api_key = get_token()))
  bundle = suppress(connectapi::bundle_dir(app_dir))
  name = paste("UAT_check_package-", Sys.Date(), sep = "_")
  content = suppress(connectapi::deploy(client, bundle, name = name))
  suppressMessages(connectapi::poll_task(content))
  return(content)
}

# Contents of /etc/os-release
get_os_sys_deps = function(os) {
  ids = stringr::str_match(os, "^ID=(.*)")[, 2]
  id = tolower(ids[!is.na(ids)])
  # TODO: Handle non ubuntu servers

  version = stringr::str_match(os, "^VERSION_ID=(.*)")[, 2]
  version = stringr::str_remove_all(version, "\"")
  version = stringr::str_replace_all(version, "\\.", "_")
  version = version[!is.na(version)]
  pkg_dir = system.file("extdata", "check_sys_deps", package = "jrHealthCheckConnect",
                        mustWork = TRUE)
  pre_req_path = file.path(pkg_dir, paste0("pre-req-", id, "-", version, ".txt"))

  clean_posit_pre_req_file(pre_req_path)
}

clean_posit_pre_req_file = function(pre_req_path) {
  pre_req = readLines(pre_req_path)
  # Pkg names are on a line starting with "#"
  pkg_names = which(stringr::str_starts(pre_req, "#"))
  # Repeat the package name and clean up
  r_pkg_names = rep(pre_req[pkg_names],
                    times = diff(c(pkg_names, length(pre_req) + 1)))
  r_pkg_names = stringr::str_match(r_pkg_names, "^# ([^\\W]*)")[, 2]

  # Combine pkg name and associated install value
  pkg_libs = tibble::tibble(r_pkg_names, sys_libs = pre_req)
  # Assumes Ubuntu
  pkg_libs = dplyr::filter(pkg_libs, stringr::str_starts(.data$sys_libs, "apt-get"))
  pkg_libs$sys_libs = stringr::str_remove_all(pkg_libs$sys_libs, "apt-get install -y ")
  pkg_libs
}

# Extracting the URL differs on first deployment and subsequent deployments
get_deploy_url = function(content) {
  url = content$get_url()
  if (is.null(url)) url = content$get_content()$url
  if (is.null(url)) stop("Missing deploy url")
  return(url)
}
