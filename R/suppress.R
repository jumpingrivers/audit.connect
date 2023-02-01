get_suppress = function(debug_level) {
  if (debug_level == 0) suppressMessages
  else function(expr) expr
}

# match.arg doesn't work on integers
get_debug_level = function(debug_level) {
  debug_level = match.arg(as.character(debug_level), as.character(0:2))
  as.integer(debug_level)
}
