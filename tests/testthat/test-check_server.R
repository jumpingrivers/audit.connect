test_that("Testing check server", {
  connect_versions = get_connect_versions()
  expect_equal(ncol(connect_versions), 3)
  expect_gt(nrow(connect_versions), 20)

  # Version not in DB
  expect_equal(lookup_version(connect_versions, server_version = "2029.01.01"), 1)
  # Really old version not in the DB
  expect_equal(lookup_version(connect_versions, server_version = "2010.01.01"),
               nrow(connect_versions) + 1)

  expect_equal(lookup_version(connect_versions, server_version = "Not in DB"),
               nrow(connect_versions) + 1)

  # No version in DB
  v = lookup_version(connect_versions, server_version = "2022.10.31")
  expect_true(is.na(v))

  expect_message(audit_server_version("2022.10.0"), regexp = "out of date")
})
