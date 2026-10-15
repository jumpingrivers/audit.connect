#
# This is a Plumber API.
#
# Commented out. Don't need plumber to deploy
library("plumber")
#* @apiTitle Installed Sys Deps
#* @apiDescription Returns the OS, installed libraries and timezone of the connect server
#* @get /installed
function() {
  os_release = readLines("/etc/os-release")
  if (any(grepl("[u|U]buntu", os_release))) {
    libs = system2("apt", args = c("list", "--installed"), stdout = TRUE)
  } else if (any(grepl("red hat|centos", os_release, ignore.case = TRUE))) {
    libs = system2("yum", args = c("list", "installed"), stdout = TRUE)
  } else {
    os_release = libs = NA
  }

  # Sys.timezone() warns when timedatectl fails, but can still find the timezone.
  # Send "" rather than NA, which doesn't survive the trip through JSON.
  timezone = suppressWarnings(Sys.timezone())
  if (is.na(timezone)) {
    timezone = ""
  }

  rtn = list(os_release = os_release, libs = libs, timezone = timezone)
  rtn
}
