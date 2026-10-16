test_that("sanitise() removes names, emails, usernames, GUIDs and user URLs", {
  users = tibble::tibble(
    email = c("ann@example.com", "bob@example.com"),
    first_name = c("Ann", "Bob"),
    last_name = c("Smith", "Jones"),
    username = c("asmith", "bjones"),
    guid = c("guid-ann", "guid-bob"),
    user_role = c("administrator", "viewer"),
    locked = c(FALSE, TRUE),
    url = paste0("https://connect.example.com/connect/#/people/users/guid-", c("ann", "bob"))
  )
  out = list(
    audit_details = list(
      email = "auditor@example.com",
      first_name = "Ada",
      last_name = "Lovelace",
      username = "alovelace",
      guid = "guid-ada",
      user_role = "administrator"
    ),
    users_details = list(
      user_list = list(user_account_limit = 10, users = users),
      locked_apps = tibble::tibble(username = "bjones", n = 3L)
    )
  )

  sanitised = sanitise(out)
  values = unlist(sanitised, use.names = FALSE)
  personal = c(
    "@example.com",
    "Ann",
    "Bob",
    "Smith",
    "Jones",
    "asmith",
    "bjones",
    "Ada",
    "Lovelace",
    "alovelace",
    "guid-",
    "/people/users/"
  )
  for (pattern in personal) {
    expect_false(any(grepl(pattern, values, fixed = TRUE)), label = pattern)
  }
  # The report still has the counts and roles it needs
  expect_identical(sanitised$users_details$user_list$users$user_role, users$user_role)
  expect_identical(get_quarto_locked_user_apps(sanitised), 3L)
})
