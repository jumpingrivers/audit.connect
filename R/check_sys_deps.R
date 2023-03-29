#' Checking System Dependencies
#'
#' Many R packages require additional system dependencies.
#' This check, obtains a list of system libraries installed on the connect server, then
#' determines which R packages can't be installed.
#' @noRd
check_sys_deps = function(debug_level = 0:2) {
  debug_level = get_debug_level(debug_level)

  app_dir = file.path(tempdir(), "pkg")
  pkg_dir = system.file("extdata", "check_sys_deps",
                        package = "jrHealthCheckConnect",
                        mustWork = TRUE)
  fs::dir_copy(pkg_dir, app_dir)
  on.exit(cleanup_plumber(app_dir, content, debug_level))
  content = setup_plumber_sys_deps_endpoint(app_dir, debug_level)

  # Ping endpoint
  url = paste0(get_deploy_url(content), "installed")
  auth_key = paste0("Key ", get_token())
  resp = httr::GET(url, httr::add_headers(Authorization = auth_key))
  rtn = jsonlite::parse_json(rawToChar(resp$content))

  uatBase::check_sys_deps(rtn$os, rtn$libs, debug_level)
}

setup_plumber_sys_deps_endpoint = function(app_dir, debug_level) { #nolint
  suppress = get_suppress(debug_level)
  # Deploy plumber
  client = suppress(connectapi::connect(server = get_server(), api_key = get_token()))
  bundle = suppress(connectapi::bundle_dir(app_dir))
  name = paste("UAT_check_package-", Sys.Date(), sep = "_")
  content = suppress(connectapi::deploy(client, bundle, name = name))
  suppress(connectapi::poll_task(content))
  return(content)
}

# Extracting the URL differs on first deployment and subsequent deployments
get_deploy_url = function(content) {
  url = content$get_url()
  if (is.null(url)) url = content$get_content()$url
  if (is.null(url)) stop("Missing deploy url")
  return(url)
}
