test_that("RMarkdown deployment for HTML deployment using connectapi::bundle_dir",
          {
            #publish_markdown_document has a return(invisible(TRUE)) statement at the end of it
            #if we don't get to it, it means that the function hasn't been fully executed
            #due to an error somewhere in it:
            expect_true(
              publish_rmd_as_html(
                input_rmd_name_in_extdata = "test-rmd-document.Rmd",
                deploy_name = "uat-rmd-test1"
              )
            )
          })

test_that("RMarkdown deployment for PDF deployment using connectapi::bundle_static",
          {
            testthat::skip_on_ci()
            expect_true(
              publish_rmd_as_static_bundle(
                input_rmd_name_in_extdata = "test-rmd-to-pdf-document.Rmd",
                deploy_name = "uat-rmd-test1"
              )
            )
          })

test_that("RMarkdown deployment for Word deployment using connectapi::bundle_static",
          {
            expect_true(
              publish_rmd_as_static_bundle(
                input_rmd_name_in_extdata = "test-rmd-to-word-document.Rmd",
                deploy_name = "uat-rmd-test1"
              )
            )
          })
