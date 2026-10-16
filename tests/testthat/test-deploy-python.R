test_that("A failed Python deploy still deletes the content Connect created", {
  calls = new.env()
  calls$deleted = character(0)
  title = paste("UAT: Python", "api", Sys.Date(), sep = "-")
  testthat::local_mocked_bindings(
    get_server = function(...) "https://connect.example.com/",
    get_token = function() "key",
    get_rsconnect_path = function() "rsconnect"
  )
  testthat::local_mocked_bindings(
    run = function(...) stop("rsconnect deploy failed"),
    .package = "processx"
  )
  testthat::local_mocked_bindings(
    connect = function(...) "client",
    get_content = function(...) tibble::tibble(guid = c("a", "b"), title = c(title, "Other")),
    content_item = function(con, guid) guid,
    content_delete = function(item, ...) calls$deleted = c(calls$deleted, item),
    .package = "connectapi"
  )
  python_dir = system.file("extdata", "deploy_python", "flask", package = "audit.connect")

  expect_error(deploy_python(python_dir, "app.py", "api", debug_level = 0), "deploy failed")
  expect_identical(calls$deleted, "a")
})

test_that("Python deploys let Connect choose the Python and keep the key off the command line", {
  calls = new.env()
  testthat::local_mocked_bindings(
    get_server = function(...) "https://connect.example.com/",
    get_token = function() "key",
    get_rsconnect_path = function() "rsconnect",
    cleanup_python = function(...) invisible(NULL)
  )
  testthat::local_mocked_bindings(
    run = function(command, args, wd, env, ...) {
      calls$args = args
      calls$env = env
      calls$pyproject = readLines(file.path(wd, "pyproject.toml"))
      list(status = 0L)
    },
    .package = "processx"
  )
  python_dir = system.file("extdata", "deploy_python", "voila", package = "audit.connect")

  expect_true(deploy_python(python_dir, "hash.ipynb", "voila", debug_level = 0))
  expect_true('requires-python = ">=3.10"' %in% calls$pyproject)
  expect_identical(calls$args[1:3], c("deploy", "voila", "hash.ipynb"))
  expect_false("key" %in% calls$args)
  expect_identical(calls$env[["CONNECT_API_KEY"]], "key")
})

test_that("Python checks are logged as skipped without rsconnect-python", {
  old = .connect$rsconnect_python
  withr::defer(assign("rsconnect_python", old, envir = .connect))
  .connect$rsconnect_python = FALSE
  testthat::local_mocked_bindings(deploy_python = function(...) stop("should not deploy"))
  checks = list(
    check_deploy_python_flask,
    check_deploy_python_streamlit,
    check_deploy_python_voila,
    check_deploy_quarto_python
  )
  for (check in checks) {
    obj = check$new(dir = withr::local_tempdir())
    obj$check(debug_level = 0)
    expect_true(is.na(obj$get_log()$passed))
  }
})
