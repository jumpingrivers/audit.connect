#' Run Posit Checks
#'
#' This functions runs all Posit tests.
#' To skip tests, set check to `no` in the config yaml file.
#' See `create_config()`
#' @param server Connect server (URL). If NULL, use the ENV variable CONNECT_SERVER.
#' @param token Connect api token. If NULL, use the ENV variable CONNECT_API_KEY
#' @param dir directory location of the the config file
#' @param debug_level Integer, 0 to 2.
#' @details
#' Debug level description
#'  * 0: clean-up all files; suppress all noise
#'  * 1: clean-up all files, but display build steps
#'  * 2: No clean-up (on connect and on disk) and display build steps
#' @importFrom rlang .data .env
#' @importFrom R6 R6Class
#' @import audit.base
#' @export
check = function(server = NULL, token = NULL, dir = ".", debug_level = 0:2) {
  debug_level = get_debug_level(force(debug_level))
  # rsconnect saves the account, API key included, in its config folder; use a temporary one
  withr::local_envvar(R_USER_CONFIG_DIR = withr::local_tempdir())
  check_list = list()
  check_list$setup = summarise_setup(server, token)
  check_list$audit_details = audit_details(get_server(), get_token())
  check_list$server_headers = audit.base::check_server_headers(get_server())
  check_list$posit_version = check_posit_version(
    get_server(),
    get_token(),
    debug_level = debug_level
  )
  check_list$sys_deps = check_sys_deps(debug_level = debug_level)
  check_list$timezone = check_connect_timezone()
  check_list$versions = summarise_versions(get_server(), get_token())

  # check_list$feature_usage = summarise_feature_usage(get_server(), get_token()) #nolint
  check_list$users_details = summarise_users(
    server = get_server(),
    token = get_token(),
    debug_level = debug_level
  )
  register_uat_user(get_server(), get_token(), account = get_account())

  check_list$results = check_deployments(dir, debug_level)
  cli::cli_h1("All checks complete")
  invisible(check_list)
}
