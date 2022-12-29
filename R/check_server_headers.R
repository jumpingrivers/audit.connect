.security_headers = c(
  "content-security-policy", "access-control-allow-origin",
  "strict-transport-security", "scheme",
  "x-frame-options", "x-content-type-options",
  "feature-policy", "referrer-policy",
  "server", "x-xss-protection",
  "x-permitted-cross-domain-policies",
  "x-powered-by")

check_server_headers = function(server) {
  cli::cli_h2("Checking headers")
  hrdrs = get_response_headers(server)
  hrdrs_summary = purrr::map2_df(hrdrs, names(hrdrs), header_summary)
  missing_hrdrs = .security_headers[!.security_headers %in% hrdrs_summary$security_header]
  all_hrdrs = dplyr::bind_rows(hrdrs_summary, get_missing_headers(missing_hrdrs)) |>
    dplyr::arrange(.data$security_header)
  for (i in seq_along(.security_headers)) {
    hrdr = all_hrdrs[i, ]
    col = if (hrdr$status == "OK") cli::col_green else cli::col_red #nolint
    cli::cli_alert_info("{col(hrdr$security_header)}: {hrdr$message}")
  }
  return(all_hrdrs)
}

get_response_headers = function(server) {
  res = httr::HEAD(server)
  out = c(
    httr::headers(res),
    list(scheme = httr::parse_url(res$url)[["scheme"]])
  )
  # Add class to for header_summary functions
  out = purrr::map2(out, names(out), ~{
    class(.x) = .y
    .x
  })
  out
}

get_missing_headers = function(security_headers)  {
  if (length(security_headers) == 0L) return(NULL)
  dplyr::tibble(security_header = security_headers,
                 status = "WARN",
                 message = "Header not set",
                 value = NA_character_)
}
