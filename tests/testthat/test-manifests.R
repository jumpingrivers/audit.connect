# We can break Connect if we deploy using a binary package that doesn't match
# Connect's OS. To keep things simple, we enfore that the Repo in manifests
# must use the boring CRAN Repo
test_that("Check Manifest files", {
  pkg_files = system.file(package = "jrHealthCheckConnect", mustWork = TRUE)

  manifests = list.files(pkg_files, recursive = TRUE, pattern = "manifest\\.json$",
                         full.names = TRUE)
  for (i in seq_along(manifests)) {
    manifest = jsonlite::read_json(manifests[i])

    is_cran = purrr::map_lgl(manifest$packages,
                             function(i) stringr::str_starts(i$Repository, "https://cloud.r-project.org")) #nolint
    expect_true(all(is_cran))
  }
}
)
