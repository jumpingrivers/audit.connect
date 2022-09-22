test_that("RMarkdown deployment", {
  #publish_markdown_document has a return(invisible(TRUE)) statement at the end of it
  #if we don't get to it, it means that the function hasn't been fully executed
  #due to an error somewhere in it:
  expect_true(publish_markdown_document())
})
