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
