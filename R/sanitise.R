#' Sanitise {audit.connect} object
#'
#' This function removes user-identifying data from an {audit.connect} object
#' @param audit_connect_check An object from audit.connect::check()
#' @export
sanitise = function(audit_connect_check) {
  user_list = audit_connect_check$users_details$user_list
  # Wipe any user-identifiable data:
  user_list$users[, "email"] = NA_character_
  user_list$users[, "username"] = NA_character_
  user_list$users[, "first_name"] = NA_character_
  user_list$users[, "last_name"] =  NA_character_
  audit_connect_check$users_details$user_list = user_list
  # Return the santitized object
  audit_connect_check
}
