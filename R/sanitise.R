#' Sanitise audit.connect object
#'
#' This function removes user-identifying data from an audit.connect object:
#' the auditor's name, email, username and GUID, the same fields for every
#' user, each user's GUID and URL, and the usernames of locked users who own
#' content. Counts, roles and dates are kept, so the report still renders.
#' @param audit_connect_check An object from `audit.connect::check()`
#' @export
sanitise = function(audit_connect_check) {
  personal = c("email", "first_name", "last_name", "username")

  for (value in c(personal, "guid")) {
    if (!is.null(audit_connect_check$audit_details[[value]])) {
      audit_connect_check$audit_details[[value]] = NA_character_
    }
  }

  users = audit_connect_check$users_details$user_list$users
  if (!is.null(users)) {
    users[intersect(personal, colnames(users))] = NA_character_
    users = users[setdiff(colnames(users), c("guid", "url"))]
    audit_connect_check$users_details$user_list$users = users
  }

  locked_apps = audit_connect_check$users_details$locked_apps
  if (!is.null(locked_apps)) {
    locked_apps$username = NA_character_
    audit_connect_check$users_details$locked_apps = locked_apps
  }
  audit_connect_check
}
