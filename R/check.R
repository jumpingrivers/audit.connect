#' Run UAT Checks
#'
#' This functions runs all UAT tests.
#' To skip tests, set check to `no` in the config yaml file.
#' See `create_config()`
#' @param server RSC server. If NULL, use the ENV variable CONNECT_SERVER
#' @param token RSC api token. If NULL, use the ENV variable CONNECT_API_KEY
#' @param dir directory location of the the config file
#' @param file config file name
#' @importFrom rlang .data .env
#' @export
check = function(server = NULL, token = NULL,
                 dir = ".", file = "config-uat.yml") {
  check_list = list()
  check_list$setup = summarise_setup(server, token)
  check_list$user_details = summarise_user(get_server(), get_token())
  check_list$versions = summarise_versions(get_server(), get_token())
  check_list$sys_deps = check_sys_deps()
  register_uat_user(get_server(), get_token(), account = check_list$user_details$username)

  cli::cli_h2("Starting deployment checks")
  r6_inits = init_r6_checks(dir = dir, file = file)
  lapply(r6_inits, function(r6) r6$check())
  check_list$deployments = purrr::map_dfr(r6_inits, ~.x$get_log())
  check_list$deployments = dplyr::arrange(check_list$deployments, .data$group, .data$short)
  check_list
}

init_r6_checks = function(dir, file) {
  exports = getNamespaceExports("jrHealthCheckConnect")
  check_exports = sort(exports[stringr::str_starts(exports, "check_deploy")])
  r6_inits = lapply(check_exports, init_r6_check, dir = dir, file = file)
  r6_inits
}

init_r6_check = function(export, dir, file) {
  obj = eval(parse(text = export))
  if (inherits(obj, "R6ClassGenerator")) {
    obj = obj$new(dir, file)
  } else {
    obj = NULL
  }
  return(obj)
}
