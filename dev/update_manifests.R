# Regenerate every manifest.json under inst/extdata. Run it from the package
# root; the README section "Updating the manifests" shows how.
#
# The manifests are written by an R installed at /opt/R/<r_version>, since
# writeManifest() records the R version it runs under, and Connect needs a
# matching R. Packages are installed from CRAN source into an empty library,
# so every manifest points at https://cloud.r-project.org and never at
# binaries built for another OS (see tests/testthat/test-manifests.R).
update_manifests = function(r_version = "4.4.3", path = ".") {
  rscript = file.path("/opt/R", r_version, "bin", "Rscript")
  if (!file.exists(rscript)) {
    cli::cli_abort("Can't find {.file {rscript}}. Install R {r_version}, for example with rig.")
  }
  manifests = list.files(
    file.path(path, "inst", "extdata"),
    pattern = "^manifest\\.json$",
    recursive = TRUE,
    full.names = TRUE
  )
  app_dirs = normalizePath(dirname(manifests))
  cli::cli_alert_info("Updating {length(app_dirs)} manifest{?s} with R {r_version}")

  lib = tempfile("manifest-lib-")
  dir.create(lib)
  on.exit(unlink(lib, recursive = TRUE), add = TRUE)
  script = tempfile(fileext = ".R")
  on.exit(unlink(script), add = TRUE)
  writeLines(
    c(
      paste("write_manifests =", paste(deparse(write_manifests), collapse = "\n")),
      "write_manifests(commandArgs(trailingOnly = TRUE))"
    ),
    script
  )

  # Point every library variable at the empty library, so nothing from the
  # user or site library ends up in a manifest
  env = c(
    paste0("R_LIBS=", lib),
    paste0("R_LIBS_USER=", lib),
    paste0("R_LIBS_SITE=", lib),
    "R_PROFILE_USER=/dev/null",
    "R_ENVIRON_USER=/dev/null"
  )
  status = system2(rscript, c(shQuote(script), shQuote(app_dirs)), env = env)
  if (status != 0) {
    cli::cli_abort("Writing the manifests failed with status {status}.")
  }
  cli::cli_alert_success("Updated {.file {manifests}}")
  invisible(manifests)
}

# Runs in the child R. Installs rsconnect and whatever the apps use, then
# writes a manifest that lists only the files in each app directory.
write_manifests = function(app_dirs) {
  options(
    repos = c(CRAN = "https://cloud.r-project.org"),
    Ncpus = parallel::detectCores(),
    # Otherwise the locale comes from whoever runs this
    rsconnect.locale = "en_US"
  )
  utils::install.packages("rsconnect", type = "source", quiet = TRUE)
  deps = unique(renv::dependencies(app_dirs, quiet = TRUE)$Package)
  deps = setdiff(deps, rownames(utils::installed.packages()))
  utils::install.packages(deps, type = "source", quiet = TRUE)

  for (app_dir in app_dirs) {
    app_files = setdiff(list.files(app_dir), "manifest.json")
    rsconnect::writeManifest(appDir = app_dir, appFiles = app_files, quiet = TRUE)
    message("Wrote ", file.path(app_dir, "manifest.json"))
  }
}
