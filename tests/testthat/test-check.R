test_that("High level test", {
  testthat::skip_on_ci()
  create_config(default = TRUE)
  expect_error(check(server = "aaa.bbb"))
  # Run standard check
  rtn = suppressMessages(check())

  expect_true(is.list(rtn))
  check_names = c("setup", "posit_version", "server_headers",
                  "audit_details", "users_details", "versions", "sys_deps", "results") %in%
    names(rtn)
  expect_true(all(check_names))
  expect_equal(ncol(rtn$results), 6)

  # Check Quarto report
  # Copy over necessary files
  tmpdir = tempdir()
  input = system.file("extdata", "report", "report.qmd",
                      package = "audit.connect",
                      mustWork = TRUE)
  file.copy(input, tmpdir, overwrite = TRUE)
  saveRDS(rtn, file = file.path(tmpdir, "output.rds"))

})
