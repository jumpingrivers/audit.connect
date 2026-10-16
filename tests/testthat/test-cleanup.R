mock_content_delete = function(calls) {
  testthat::local_mocked_bindings(
    content_delete = function(...) calls$deleted = TRUE,
    .package = "connectapi",
    .env = parent.frame()
  )
}

test_that("cleanup_plumber() deletes deployed content", {
  calls = new.env()
  calls$deleted = FALSE
  mock_content_delete(calls)
  bundle_dir = tempfile()
  dir.create(bundle_dir)
  content = structure(list(), class = c("ContentTask", "Content", "R6"))

  cleanup_plumber(bundle_dir, content, debug_level = 0)
  expect_true(calls$deleted)
  expect_false(dir.exists(bundle_dir))
})

test_that("cleanup_plumber() skips content that was never deployed", {
  calls = new.env()
  calls$deleted = FALSE
  mock_content_delete(calls)
  bundle_dir = tempfile()
  dir.create(bundle_dir)
  content = try(stop("deploy failed"), silent = TRUE)

  cleanup_plumber(bundle_dir, content, debug_level = 0)
  expect_false(calls$deleted)
  expect_false(dir.exists(bundle_dir))
})

test_that("A failed sys-deps build still deletes the endpoint", {
  calls = new.env()
  calls$deleted = FALSE
  mock_content_delete(calls)
  testthat::local_mocked_bindings(
    get_server = function(...) "https://connect.example.com/",
    setup_plumber_sys_deps_endpoint = function(...) {
      structure(list(), class = c("ContentTask", "Content", "R6"))
    }
  )
  testthat::local_mocked_bindings(
    poll_task = function(...) stop("build failed"),
    .package = "connectapi"
  )

  expect_identical(check_sys_deps(debug_level = 0), NA)
  expect_true(calls$deleted)
})

test_that("cleanup_quarto() deletes by title when the deploy left no record", {
  calls = new.env()
  calls$deleted = character(0)
  title = paste("UAT: Quarto", Sys.Date())
  testthat::local_mocked_bindings(
    get_server = function(...) "https://connect.example.com/",
    get_token = function() "key"
  )
  testthat::local_mocked_bindings(
    connect = function(...) "client",
    get_content = function(...) tibble::tibble(guid = c("a", "b"), title = c(title, "Other")),
    content_item = function(con, guid) guid,
    content_delete = function(item, ...) calls$deleted = c(calls$deleted, item),
    .package = "connectapi"
  )
  tmp_dir = withr::local_tempdir()

  cleanup_quarto(tmp_dir, debug_level = 0, title = title)
  expect_identical(calls$deleted, "a")
  expect_false(dir.exists(tmp_dir))
})
