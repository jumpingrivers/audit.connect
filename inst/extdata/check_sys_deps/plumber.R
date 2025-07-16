#
# This is a Plumber API.
#
# Commented out. Don't need plumber to deploy
library("plumber")
#* @apiTitle Installed Sys Deps
#* @apiDescription Returns the OS and the libraries installed on the connect server
#* @get /installed
function() {
  os_release = readLines("/etc/os-release")
  if (any(grepl("[u|U]buntu", os_release))) {
    libs = system2("apt", args = c("list", "--installed"), stdout = TRUE)
  } else if (any(grepl("[r|R]ed [h|Hat]", "Red Hat"))) {
    libs = system2("yum", args = c("list", "installed"), stdout = TRUE)
  } else {
    os_release = libs = NA
  }

  rtn = list(os_release = os_release, libs = libs)
  rtn
}
