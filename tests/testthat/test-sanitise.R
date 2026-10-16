test_that("sanitise() removes names, emails, usernames, GUIDs and user URLs", {
  personal = c("email", "first_name", "last_name", "username")
  out = list(
    audit_details = list(
      email = "ada@example.com",
      first_name = "Ada",
      last_name = "Lovelace",
      username = "alovelace",
      guid = "guid-ada",
      user_role = "administrator"
    ),
    users_details = list(
      user_list = list(
        users = tibble::tibble(
          email = "bob@example.com",
          first_name = "Bob",
          last_name = "Jones",
          username = "bjones",
          guid = "guid-bob",
          user_role = "viewer",
          url = "https://connect.example.com/connect/#/people/users/guid-bob"
        )
      ),
      locked_apps = tibble::tibble(username = "bjones", n = 3L)
    )
  )

  sanitised = sanitise(out)
  users = sanitised$users_details$user_list$users

  expect_named(users, c(personal, "user_role"))
  expect_true(all(is.na(users[personal])))
  expect_true(all(is.na(sanitised$audit_details[c(personal, "guid")])))
  expect_identical(sanitised$audit_details$user_role, "administrator")
  expect_identical(sanitised$users_details$locked_apps$username, NA_character_)
})
