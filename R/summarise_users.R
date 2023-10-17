summarise_users = function(server, token, debug_level) {
  suppress = get_suppress(debug_level)
  cli::cli_h2("Checking Connect Users")
  client = suppress(connectapi::connect(server = server, api_key = token))

  settings = client$server_settings()
  user_list = list()
  user_list$user_account_limit = settings$license$users
  user_list$users = suppress(connectapi::get_users(client, limit = Inf))

  if (is_evaluation(settings)) {
    apps = NA
  } else {
    print_audit_users(user_list)
    apps = print_audit_user_apps(client, debug_level)
  }
  list(user_list = user_list, apps = apps)
}

is_evaluation = function(settings) {
  if (settings$license$status == "evaluation") {
    cli::cli_alert_info("Evaluation license detected.")
    cli::cli_alert_info("Skipping user audits")
  }
  settings$license$status == "evaluation"
}

print_audit_users = function(user_list) {
  user_summary = user_list$users %>%
    dplyr::filter(!.data$locked) %>%
    dplyr::count(.data$user_role)

  user_vec = paste(stringr::str_to_title(user_summary$user_role), user_summary$n, sep = ": ")
  user_string = paste(user_vec, collapse = ", ") # nolint: object_usage_linter
  admins = dplyr::filter(user_list$users, .data$user_role == "administrator" & !.data$locked) # nolint: object_usage_linter

  cli::cli_alert_info("Users: {sum(user_summary$n)} out of {user_list$user_account_limit}")
  cli::cli_alert_info("User breakdown: {user_string}")
  cli::cli_alert_info("{nrow(admins)} Administrators: {admins$username}")
}

print_audit_user_apps = function(client, debug_level) {
  suppress = get_suppress(debug_level)
  apps = suppress(connectapi::cache_apps(client))
  # Remove any api keys; don't need or want them
  apps = purrr::map(apps, ~{.x$EnvironmentJson = NULL; .x})
  app_creators =  purrr::map_df(apps,
                                ~dplyr::tibble(owner = .x[["owner_username"]],
                                               locked = .x$owner_locked))
  locked_users = dplyr::filter(app_creators, .data$locked) # nolint: object_usage_linter
  cli::cli_alert_info("{nrow(locked_users)} applications owned by locked users")
  apps
}

#' Santitize {audit.connect} object
#'
#' This function wipes any user-identifying data from an {audit.connect} object,
#' but inserts a column which contains the URL for each user in the Posit Connect admin panel
#' @param audit_connect_object_arg An object from audit.connect::check()
#' @export
sanitize <- function(audit_connect_object_arg) {
  # Retrieve the URL of the server from the audit connect object:
  connect_server_url = audit_connect_object_arg$audit_details$server

  # Make a copy of the audit connect object:
  sanitized_audit_object = audit_connect_object_arg

  # Wipe any user-identifiable data:
  sanitized_audit_object$users_details$user_list$users[, 'email'] = NA
  sanitized_audit_object$users_details$user_list$users[, 'username'] = NA
  sanitized_audit_object$users_details$user_list$users[, 'first_name'] = NA
  sanitized_audit_object$users_details$user_list$users[, 'last_name'] = NA

  # The table contains a column `guid`. We can use these GUIDs to create URLs
  # If we go to one of these URLs in the browser, we can see the details for the corresponding user:
  sanitized_audit_object$users_details$user_list$users[, 'url'] <-
    stringr::str_c(connect_server_url,
                   "connect/#/people/users/",
                   sanitized_audit_object$guid)

  # Return the santitized object
  sanitized_audit_object
}
