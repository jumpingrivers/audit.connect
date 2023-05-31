summarise_feature_usage = function(server, token) {
  suppress = get_suppress(debug_level)
  cli::cli_h2("Checking Feature Usage")
  client = suppress(connectapi::connect(server = server, api_key = token))
  client = connect$get_connect()
  feat_usage = client$GET("v1/experimental/feature_usage")
  feat_usage = dplyr::bind_rows(feat_usage)
  used = feat_usage$name[feat_usage$used]
  unused = feat_usage$name[!feat_usage$used]
  cli::cli_alert_info("Features used: {used}")
  cli::cli_alert_info("Features unused: {unused}")
  return(feat_usage)
}
