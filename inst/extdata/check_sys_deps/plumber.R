#
# This is a Plumber API.
#
# Commented out. Don't need plumber to deploy
library("plumber")

# apt or yum, from os-release ID and ID_LIKE, so Debian, Rocky and AlmaLinux are listed too.
# audit.base decides whether Posit Package Manager supports the OS.
package_tool = function(os_release) {
  ids = sub("^ID(_LIKE)?=", "", os_release[grepl("^ID(_LIKE)?=", os_release)])
  ids = strsplit(tolower(gsub("\"", "", ids)), " ")
  ids = unlist(ids)
  if (any(ids %in% c("debian", "ubuntu"))) {
    "apt"
  } else if (any(ids %in% c("rhel", "centos", "fedora"))) {
    "yum"
  } else {
    NA_character_
  }
}

#* @apiTitle Installed Sys Deps
#* @apiDescription Returns the OS, installed libraries and timezone of the connect server
#* @get /installed
function() {
  os_release = readLines("/etc/os-release")
  tool = package_tool(os_release)
  if (identical(tool, "apt")) {
    libs = system2("apt", args = c("list", "--installed"), stdout = TRUE)
  } else if (identical(tool, "yum")) {
    libs = system2("yum", args = c("list", "installed"), stdout = TRUE)
  } else {
    # Still send os_release, so audit.base can say which OS isn't supported
    libs = NA
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
