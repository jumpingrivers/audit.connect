#' Quarto Helper Functions
#'
#' In general not used by users.
#' @param out Output from check
#' @export
get_quarto_old_users = function(out) {
  # Order by domain then email
  old_users = out$users_details$user_list$users %>%
    dplyr::filter(!.data$locked)
  old_users$email = tolower(old_users$email)
  old_users$domain = stringr::str_match(old_users$email, "@(.*)")[, 2]
  old_users = dplyr::arrange(old_users, domain, email)

  old_users = old_users %>%
    dplyr::mutate(last_log_on_diff = lubridate::interval(.data$active_time, lubridate::now()) / months(1), #nolint
                  last_log_in = dplyr::case_when(
                    last_log_on_diff > 12 ~ "12 months+",
                    last_log_on_diff > 6 & last_log_on_diff < 12 ~ "6 months+",
                    last_log_on_diff > 3 & last_log_on_diff < 6 ~ "3 months+",
                    .default = NA)) %>%
    dplyr::filter(.data$last_log_on_diff > 3) %>%

    dplyr::group_by(.data$last_log_in) %>%
    dplyr::reframe(email = paste(.data$email, collapse = ", ")) %>%
    dplyr::mutate(last_log_in = factor(.data$last_log_in,
                                       c("12 months+", "6 months+", "3 months+"),
                                       ordered = T)) %>%
    dplyr::arrange(.data$last_log_in)
  old_users$n = stringr::str_count(old_users$email, ",") + 1
  old_users
}

#' @rdname get_quarto_old_users
#' @export
get_quarto_user_roles = function(out) {
  users = out$users_details$user_list$users
  users = dplyr::filter(users, !.data$locked)
  viewer = users[users$user_role == "viewer", ]$username
  publisher = users[users$user_role == "publisher", ]$username
  administrator = users[users$user_role == "administrator", ]$username
  list(viewer = viewer, publisher = publisher, administrator = administrator)
}

#' @rdname get_quarto_old_users
#' @export
get_quarto_locked_user_apps = function(out) {
  apps = out$users_details$apps

  app_creators =  purrr::map_df(apps,
                                ~dplyr::tibble(owner = .x[["owner_username"]],
                                               locked = .x$owner_locked))
  locked_users = dplyr::filter(app_creators, .data$locked) # nolint: object_usage_linter
  nrow(locked_users)
}
