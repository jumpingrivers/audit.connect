test_that("High level test", {
  rtn = check()
  expect_s3_class(rtn, "tbl_df")
  expect_gte(nrow(rtn), 3)
  expect_equal(ncol(rtn), 5)
  expect_error(check(server = "aaa.bbb"))
})
