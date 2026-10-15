test_that("check_connect_timezone() reports set, unset and unknown", {
  on.exit(assign("timezone", NULL, envir = .connect))
  .connect$timezone = "Europe/London"
  expect_true(suppressMessages(check_connect_timezone()))
  .connect$timezone = ""
  expect_false(suppressMessages(check_connect_timezone()))
  .connect$timezone = NULL
  expect_true(is.na(suppressMessages(check_connect_timezone())))
})

test_that("The sys deps endpoint returns a timezone that survives JSON", {
  # Connect only runs on Linux, so the endpoint does too
  skip_if_not(Sys.info()[["sysname"]] == "Linux")
  plumber_file = system.file("extdata", "check_sys_deps", "plumber.R", package = "audit.connect")
  exprs = parse(plumber_file)
  endpoint = eval(exprs[[length(exprs)]])
  rtn = endpoint()
  expect_type(rtn$timezone, "character")
  expect_length(rtn$timezone, 1)
  for (auto_unbox in c(TRUE, FALSE)) {
    json = jsonlite::toJSON(rtn["timezone"], auto_unbox = auto_unbox)
    expect_identical(unlist(jsonlite::parse_json(json)$timezone), rtn$timezone)
  }
})
