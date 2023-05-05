check_deployments = function(dir, debug_level) {
  cli::cli_h2("Document Deployment Checks")
  r6_inits = init_r6_checks(dir = dir, file = "config-uat-rsc.yml")
  lapply(r6_inits, function(r6) r6$check(debug_level = debug_level))
  deployments = purrr::map_dfr(r6_inits, ~.x$get_log())
  deployments = dplyr::arrange(deployments, .data$group, .data$short)
  deployments
}
