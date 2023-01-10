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
  headers = get_response_headers(server)
  headers_summary = purrr::map2_df(headers, names(headers), header_summary)
  missing_headers = .security_headers[!.security_headers %in% headers_summary$security_header]
  all_headers = dplyr::bind_rows(headers_summary, get_missing_headers(missing_headers)) |>
    dplyr::arrange(.data$security_header)
  for (i in seq_along(.security_headers)) {
    header = all_headers[i, ]
    col = if (header$status == "OK") cli::col_green else cli::col_red #nolint
    cli::cli_alert_info("{col(header$security_header)}: {header$message}")
  }
  return(all_headers)
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
