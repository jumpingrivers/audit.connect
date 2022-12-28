#' Create test config
#'
#' Some PSC servers intentionally won't have some features implemented.
#' Tests can be skipped using a config-uat.yml file.
#'
#' This function creates an example config. By default all tests are TRUE.
#'
#' @param dir Directory of the config file
#' @param file Config file name
#' @param default Default value for if a test should run (logical)
#' @details If a test is missing from the config file, it is assume to be TRUE.
#' Therefore, the config file can be quite short and just list exceptions.
#' If the config file is missing, then all tests are carried out.
#' @export
create_config = function(dir = ".", file = "config-uat.yml", default = TRUE) {
  obj_info = get_check_info(dir, file)
  groups = unique(obj_info$group)
  shorts = purrr::map(groups, ~obj_info[obj_info$group == .x, ]$short)
  group_shorts = purrr::map(shorts, create_group_short, default = default)

  names(group_shorts) = groups
  yaml::write_yaml(group_shorts, file = file.path(dir, file))
  return(invisible(group_shorts))
}

create_group_short = function(short, default) {
  group_short = vector("list", length = length(short))
  names(group_short) = short
  purrr::map(group_short, ~default)
}

get_check_info = function(dir, file) {
  r6_inits = init_r6_checks(dir, file)
  purrr::map_dfr(r6_inits, function(r6) c("class" = class(r6)[1], r6$info()))
}
