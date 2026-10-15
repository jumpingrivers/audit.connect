# We can break Connect if we deploy using a binary package that doesn't match
# Connect's OS. To keep things simple, we enfore that the Repo in manifests
# must use the boring CRAN Repo
test_that("Check Manifest files", {
  pkg_files = system.file(package = "audit.connect", mustWork = TRUE)

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

# Connect rejects a bundle whose files don't match the manifest checksums
test_that("Manifest checksums match their files", {
  pkg_files = system.file(package = "audit.connect", mustWork = TRUE)
  manifests = list.files(
    pkg_files,
    recursive = TRUE,
    pattern = "manifest\\.json$",
    full.names = TRUE
  )
  for (manifest_path in manifests) {
    manifest = jsonlite::read_json(manifest_path)
    paths = file.path(dirname(manifest_path), names(manifest$files))
    has_file = file.exists(paths)
    expected = purrr::map_chr(manifest$files[has_file], "checksum")
    expect_equal(unname(tools::md5sum(paths[has_file])), unname(expected), label = manifest_path)
  }
})
