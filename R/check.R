#' Run UAT Checks
#'
#' This functions runs all UAT tests.
#' To skip tests, set check to `no` in the config yaml file.
#' See `create_config()`
#' @param dir directory location of the the config file
#' @param file config file name
#' @export
check = function(dir = ".", file = "config-uat.yml") {
  r6_inits = init_r6_checks(dir = dir, file = file)
  lapply(r6_inits, function(r6) r6$check())
  purrr::map_dfr(r6_inits, ~.x$get_log())
}

init_r6_checks = function(dir, file) {
  exports = getNamespaceExports("jrHealthCheckConnect")
  check_exports = exports[stringr::str_starts(exports, "check_")]
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
