#' Quarto Helper Functions
#'
#' In general not used by users.
#' @param out Output from check
#' @export
get_quarto_old_users = function(out) {
  old_users = out$users_details$user_list$users |>
    dplyr::filter(!.data$locked) |>
    dplyr::mutate(last_log_on_diff = lubridate::interval(.data$active_time, lubridate::now()) / months(1), #nolint
                  last_log_in = dplyr::case_when(
                    last_log_on_diff > 12 ~ "12 months+",
                    last_log_on_diff > 6 & last_log_on_diff < 12 ~ "6 months+",
                    last_log_on_diff > 3 & last_log_on_diff < 6 ~ "3 months+",
                    .default = NA)) |>
    dplyr::filter(.data$last_log_on_diff > 3) |>
    dplyr::arrange(.data$last_log_on_diff) |>
    dplyr::group_by(.data$last_log_in) |>
    dplyr::reframe(email = paste(sort(.data$email), collapse = ", "))
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
