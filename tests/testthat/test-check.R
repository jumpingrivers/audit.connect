test_that("High level test", {
  # Skip the deployment tests on the CI
  # Takes a while
  create_config(default = !isTRUE(as.logical(Sys.getenv("CI"))))

  rtn = check()

  expect_true(is.list(rtn))
  check_names = c("setup", "user_details", "versions", "sys_deps", "deployments") %in%  names(rtn)
  expect_true(all(check_names))

  expect_equal(ncol(rtn$deployments), 5)
  expect_error(check(server = "aaa.bbb"))
})
