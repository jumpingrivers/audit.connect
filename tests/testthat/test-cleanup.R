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
