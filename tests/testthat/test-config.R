test_check_values = function(con, value = TRUE) {
  for (v in names(con)) {
    if (is.list(con[[v]])) {
      test_check_values(con[[v]], value) # nolint: object_usage_linter
    } else if (con[[v]] != value) {
      stop(v, " should be ", value)
    }
  }
  NULL
}

test_that("Config file test", {
  # Setup
  tmpdir = tempdir()
  config_path = file.path(tmpdir, "config.yml")

  # Basic test
  create_config(dir = tmpdir, file = "config.yml", type = "force")
  expect_true(file.exists(config_path))
  con = yaml::read_yaml(config_path)
  expect_null(test_check_values(con, TRUE))

  # Don't overwrite
  expect_error(create_config(dir = tmpdir, file = "config.yml", type = "error"))

  # Test Merge
  con$deploy_pins$rds = FALSE
  con$bad_value = TRUE
  yaml::write_yaml(con, config_path)
  create_config(dir = tmpdir, file = "config.yml", type = "merge")
  con = yaml::read_yaml(config_path)

  # Had bad_value been removed
  expect_null(con$bad_value)
  # Has FALSE been preserved
  expect_false(con$deploy_pins$rds)
  con$deploy_pins$rds = TRUE

  expect_null(test_check_values(con, TRUE))
  checks = get_check_info(dir = ".", file = "missing.yml")
  expect_true(all(names(con) %in% checks$group))

})
