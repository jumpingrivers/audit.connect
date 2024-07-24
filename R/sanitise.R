#' Sanitise audit.connect object
#'
#' This function removes user-identifying data from an audit.connect object
#' @param audit_connect_check An object from `audit.connect::check()`
#' @export
sanitise = function(audit_connect_check) {
  # Wipe any user-identifiable data
  for (value in c("email", "first_name", "last_name", "username")) {
    audit_connect_check$users_details$user_list$users[, value] = NA_character_
  }
  audit_connect_check
}
