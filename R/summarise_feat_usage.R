# 2024/07/24:
# Used the experimental feature Connect. No longer seems to work.
# Leaving function here in case it comes back
summarise_feature_usage = function(server, token) {
  cli::cli_h2("Checking Feature Usage")
  connect = suppressMessages(connectapi::connect(
    server = server,
    api_key = token
  ))
  client = connect$get_connect()
  feat_usage = client$GET("v1/experimental/feature_usage")
  feat_usage = dplyr::bind_rows(feat_usage)
  used = feat_usage$name[feat_usage$used] # nolint
  unused = feat_usage$name[!feat_usage$used] # nolint
  cli::cli_alert_info("Features used: {used}")
  cli::cli_alert_info("Features unused: {unused}")
  feat_usage
}
