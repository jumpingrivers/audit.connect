# These tests deploy to CONNECT_SERVER, so they only run when asked
skip_if_not_live = function() {
  testthat::skip_if_not(
    identical(Sys.getenv("AUDIT_CONNECT_LIVE"), "true"),
    "set AUDIT_CONNECT_LIVE=true to deploy to CONNECT_SERVER"
  )
}
