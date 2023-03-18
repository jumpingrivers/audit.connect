deploy_pins = function(debug_level) {
  suppress = get_suppress(debug_level)
  board = suppress(pins::board_connect(auth = "manual", versioned = TRUE,
                                         server = get_server(),
                                         key = get_token()))

  tmp_env = new.env()
  utils::data("mtcars", package = "datasets", envir = tmp_env)
  deployed_pin = suppress(
    pins::pin_write(
      board = board,
      x = tmp_env$mtcars,
      name = "connect_uat_mtcars",
      title = "UAT: Testing pins deployment",
      description = "UAT: Testing pins deployment",
      versioned = FALSE,
      type = "rds"
    )
  )
  if (debug_level == 2) on.exit(pins::pin_delete(board, deployed_pin))
  pulled_data = pins::pin_read(board, deployed_pin)
  if (!identical(pulled_data, tmp_env$mtcars)) stop("Corrupted pins data")
  return(invisible(TRUE))
}
