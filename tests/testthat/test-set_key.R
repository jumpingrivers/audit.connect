test_that("set_key() rejects missing values without storing them", {
  withr::defer(rm(list = intersect("test_key", ls(.connect)), envir = .connect))
  for (value in list(NULL, NA_character_, "", character(0))) {
    expect_error(set_key("test_key", value), "Missing test_key")
  }
  expect_null(.connect[["test_key"]])
  expect_identical(set_key("test_key", "abc"), "abc")
  expect_identical(.connect[["test_key"]], "abc")
})

test_that("check_api_key() says when CONNECT_API_KEY is missing", {
  withr::local_envvar(CONNECT_API_KEY = NA)
  expect_error(check_api_key(NULL), "CONNECT_API_KEY missing")
  withr::local_envvar(CONNECT_API_KEY = "")
  expect_error(check_api_key(NULL), "CONNECT_API_KEY missing")
})
