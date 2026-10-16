test_that("get_quarto_locked_user_apps() counts content owned by locked users", {
  locked_apps = tibble::tibble(username = c("ann", "bob"), n = c(2L, 1L))
  expect_identical(
    get_quarto_locked_user_apps(list(users_details = list(locked_apps = locked_apps))),
    3L
  )
  # An evaluation licence skips the user audit
  expect_identical(get_quarto_locked_user_apps(list(users_details = list(locked_apps = NULL))), 0L)
})
