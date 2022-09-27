test_that("Config file test", {
  tmpdir = tempdir()
  create_config(dir = tmpdir, file = "config.yml")
  config_path = file.path(tmpdir, "config.yml")
  expect_true(file.exists(config_path))
  con = yaml::read_yaml(config_path)

  # Ensure empty config file
  checks = get_check_info(dir = ".", file = "missing.yml")
  expect_true(all(names(con) %in% checks$group))

})
