summarise_users = function(server, token, debug_level) {
  suppress = get_suppress(debug_level)
  cli::cli_h2("Checking Connect Users")
  client = suppress(connectapi::connect(server = server, api_key = token))

  settings = client$server_settings()
  user_list = list()
  user_list$user_account_limit = settings$license$users
  user_list$users = suppress(connectapi::get_users(client, limit = Inf))
  user_list$users$url = paste0(
    server,
    "connect/#/people/users/",
    user_list$users$guid
  )

  # XXX: I don't think this is right
  # Evaluation copies should have apps???
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

  user_vec = paste(
    stringr::str_to_title(user_summary$user_role),
    user_summary$n,
    sep = ": "
  )
  user_string = paste(user_vec, collapse = ", ") # nolint: object_usage_linter
  admins = dplyr::filter(
    user_list$users,
    .data$user_role == "administrator" & !.data$locked
  ) # nolint: object_usage_linter

  cli::cli_alert_info(
    "Users: {sum(user_summary$n)} out of {user_list$user_account_limit}"
  )
  cli::cli_alert_info("User breakdown: {user_string}")
  cli::cli_alert_info("{nrow(admins)} Administrators: {admins$username}")
}

print_audit_user_apps = function(client, debug_level) {
  suppress = get_suppress(debug_level)
  content = suppress(connectapi::get_content(client))
  locked_users = suppress(connectapi::get_users(client)) |>
    dplyr::filter(.data$locked)
  locked_content = dplyr::inner_join(
    content,
    locked_users,
    by = dplyr::join_by("owner_guid" == "guid")
  ) |>
    dplyr::group_by(.data$username) |>
    dplyr::summarise(n = dplyr::n()) |>
    dplyr::arrange(dplyr::desc(.data$n))

  cli::cli_alert_info(
    "{sum(locked_content$n)} applications owned by locked users"
  )

  for (i in seq_len(nrow(locked_content))) {
    row = locked_content[i, ] # nolint
    cli::cli_alert_info(
      "{row$n} locked application{?s} owned by {cli::style_italic(row$username)}"
    )
  }
  content
}
