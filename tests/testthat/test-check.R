test_that("High level test", {
  testthat::skip_on_ci()
  create_config(default = TRUE)

  rtn = check()

  expect_true(is.list(rtn))
  check_names = c("setup", "audit_details", "versions", "sys_deps", "deployments") %in%  names(rtn)
  expect_true(all(check_names))

  expect_equal(ncol(rtn$deployments), 5)
  expect_error(check(server = "aaa.bbb"))
})
