# The endpoint and its helper, without library("plumber")
load_sys_deps_endpoint = function() {
  plumber_file = system.file("extdata", "check_sys_deps", "plumber.R", package = "audit.connect")
  exprs = parse(plumber_file)
  env = new.env()
  for (expr in exprs[-c(1L, length(exprs))]) {
    eval(expr, env)
  }
  env$endpoint = eval(exprs[[length(exprs)]], env)
  env
}

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
  env = load_sys_deps_endpoint()
  rtn = env$endpoint()
  expect_type(rtn$timezone, "character")
  expect_length(rtn$timezone, 1)
  for (auto_unbox in c(TRUE, FALSE)) {
    json = jsonlite::toJSON(rtn["timezone"], auto_unbox = auto_unbox)
    expect_identical(unlist(jsonlite::parse_json(json)$timezone), rtn$timezone)
  }
})

test_that("The sys deps endpoint lists packages on Debian and RHEL rebuilds", {
  env = load_sys_deps_endpoint()
  os_releases = list(
    apt = c("ID=ubuntu", "ID_LIKE=debian"),
    apt = "ID=debian",
    yum = c("ID=\"rocky\"", "ID_LIKE=\"rhel centos fedora\""),
    yum = c("ID=\"almalinux\"", "ID_LIKE=\"rhel centos fedora\""),
    yum = c("ID=\"rhel\"", "ID_LIKE=\"fedora\"")
  )
  for (i in seq_along(os_releases)) {
    expect_identical(env$package_tool(os_releases[[i]]), names(os_releases)[i])
  }
  expect_identical(env$package_tool(c("ID=\"opensuse-leap\"", "ID_LIKE=\"suse\"")), NA_character_)
})
