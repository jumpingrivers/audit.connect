test_that("get_quarto_locked_user_apps() counts content owned by locked users", {
  locked_apps = tibble::tibble(username = c("ann", "bob"), n = c(2L, 1L))
  expect_identical(
    get_quarto_locked_user_apps(list(users_details = list(locked_apps = locked_apps))),
    3L
  )
  # An evaluation licence skips the user audit
  expect_identical(get_quarto_locked_user_apps(list(users_details = list(locked_apps = NULL))), 0L)
})

test_that("get_quarto_old_users lists users who have never logged in", {
  now = lubridate::now()
  users = tibble::tibble(
    email = c("a@x.com", "b@x.com", "c@x.com", "d@x.com"),
    locked = FALSE,
    active_time = c(now - lubridate::days(400), now - lubridate::days(200), now, NA)
  )
  out = list(users_details = list(user_list = list(users = users)))

  old_users = get_quarto_old_users(out)
  expect_equal(
    as.character(old_users$last_log_in),
    c("Never logged in", "12 months+", "6 months+")
  )
  expect_equal(old_users$email, c("d@x.com", "a@x.com", "b@x.com"))
})
