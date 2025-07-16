describe("Checking sanitize function", {
  testthat::skip_on_ci()
  # Skip report checks for speed
  create_config(default = FALSE, type = "force")
  rtn = suppressMessages(check())
  sanitize_rtn = sanitise(rtn)

  it(
    "Check users have been changed",
    expect_false(identical(
      rtn[["users_details"]],
      sanitize_rtn[["users_details"]]
    ))
  )

  it("Check everything else has stayed the same", {
    rtn[["users_details"]] = sanitize_rtn[["users_details"]] = NULL
    expect_identical(rtn, sanitize_rtn)
  })
})
