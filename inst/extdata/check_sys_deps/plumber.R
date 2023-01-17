#
# This is a Plumber API.
#
# Commented out. Don't need plumber to deploy

#* @apiTitle Installed Sys Deps
#* @apiDescription Returns the OS and the libaries installed on the connect server
#* @get /installed
function() {
  list(os = readLines("/etc/os-release"),
       libs = system2("apt", args = c("list", "--installed"), stdout = TRUE))
}
