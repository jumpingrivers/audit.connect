#' Quarto Helper Functions
#'
#' In general not used by users.
#' @param out Output from check
#' @export
get_quarto_server_header = function(out) {
  headers = out$server_headers$headers
  headers = dplyr::filter(headers, .data$primary_header)
  headers = dplyr::arrange(headers, dplyr::desc(.data$status)) |>
    dplyr::mutate(
      header_docs = purrr::map(.data$documentation, ~ htmltools::a(href = .x, "(docs)")),
      message = purrr::map2(message, .data$header_docs, ~ gt::html(paste(.x, as.character(.y))))) |>
    dplyr::mutate(value = ifelse(is.na(.data$value), "-", .data$value))
    dplyr::select(headers,  -"documentation", -"header_docs", -"primary_header")
}

#' @rdname get_quarto_server_header
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

#' @rdname get_quarto_server_header
#' @export
get_quarto_user_roles = function(out) {
  users = out$users_details$user_list$users
  users = dplyr::filter(users, !.data$locked)
  viewer = users[users$user_role == "viewer", ]$username
  publisher = users[users$user_role == "publisher", ]$username
  administrator = users[users$user_role == "administrator", ]$username
  list(viewer = viewer, publisher = publisher, administrator = administrator)
}



#' @rdname get_quarto_server_header
#' @export
get_quarto_sys_deps = function(out) {
  sys_deps = out$sys_deps
  sys_deps |>
    dplyr::group_by(.data$sys_libs) |>
    dplyr::reframe(pkg = paste(sort(.data$r_pkg_names), collapse = ", "),
                   n = length(.data$sys_libs))
}

#' @rdname get_quarto_server_header
#' @export
get_quarto_software_versions = function(out) {
  software = out$versions
  software = dplyr::select(software, "software", "version", "installed_version", "upgrade")
  software$installed_version = ifelse(is.na(software$installed_version),
                                      "-", software$installed_version)
  software
}

#' @rdname get_quarto_server_header
#' @export
get_quarto_deploy = function(out) {
  deploy = out$deployments
  deploy$type = paste0(deploy$group, ": ", deploy$short)
  deploy = dplyr::arrange(deploy, !.data$passed, .data$group)
  deploy
}

#' @rdname get_quarto_server_header
#' @export
get_quarto_server_version_msg = function(out) {
  server_version = out$server_version
  connect_versions = get_connect_versions()
  row_number = lookup_version(connect_versions, server_version)
  if (is.na(row_number)) {
    "Your server version isn't in our database.
    This could be because we've missed it or it's really old."
  } else if (row_number > 1L) {
    newer_versions = connect_versions[seq_len(row_number - 1), ]
    no_of_versions = length(unique(newer_versions$version)) #nolint
    glue::glue("Posit Connect is out of date.
             There are {no_of_versions} newer versions that fix {nrow(newer_versions)} CVEs")
  } else {
    "Posit Connect is up to date"
  }
}