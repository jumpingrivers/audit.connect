
deploy_pins = function(suppress = suppressMessages) {
  board = suppress(pins::board_rsconnect(auth = "envvar", versioned = TRUE))

  tmp_env = new.env()
  utils::data("mtcars", package = "datasets", envir = tmp_env)
  deployed_pin = suppress(
    pins::pin_write(
      board = board,
      x = tmp_env$mtcars,
      name = "connect_uat_mtcars",
      title = "UAT Test: Testing pins deployment",
      description = "UAT Test: Testing pins deployment",
      versioned = FALSE,
      type = "rds"
    )
  )
  on.exit(pins::pin_delete(board, deployed_pin))
  pulled_data = pins::pin_read(board, deployed_pin)
  if (!identical(pulled_data, tmp_env$mtcars)) stop("Corrupted pins data")

  return(invisible(TRUE))
}
