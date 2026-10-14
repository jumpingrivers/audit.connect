reset_rsconnect_path = function(old_path) {
  if (is.na(old_path)) {
    Sys.unsetenv("RSCONNECT_PATH")
  } else {
    Sys.setenv(RSCONNECT_PATH = old_path)
  }
}

test_that("RSCONNECT_PATH points to rsconnect-python", {
  rsconnect = tempfile("rsconnect")
  file.create(rsconnect)
  old_path = Sys.getenv("RSCONNECT_PATH", unset = NA)
  on.exit(reset_rsconnect_path(old_path))
  Sys.setenv(RSCONNECT_PATH = rsconnect)
  expect_identical(find_rsconnect_python(), rsconnect)
})

test_that("A missing RSCONNECT_PATH is ignored", {
  missing = tempfile("missing")
  old_path = Sys.getenv("RSCONNECT_PATH", unset = NA)
  on.exit(reset_rsconnect_path(old_path))
  Sys.setenv(RSCONNECT_PATH = missing)
  expect_false(identical(find_rsconnect_python(), missing))
})
