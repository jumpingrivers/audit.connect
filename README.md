
<!-- README.md is generated from README.Rmd. Please edit that file -->

# audit.connect

<!-- badges: start -->

[![R-CMD-check](https://github.com/jumpingrivers/audit.connect/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/jumpingrivers/audit.connect/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

This checks that a variety of applications can be deployed to a Posit
Connect Server.

## Installation

The package isn’t on CRAN. Install it from GitHub with

``` r
remotes::install_github("jumpingrivers/audit.connect")
```

For python based deployment, the python package, `rsconnect-python` is
required

``` bash
uv pip install rsconnect-python
```

If `rsconnect` isn’t on R’s `PATH`, set `RSCONNECT_PATH` to its
location.

## Usage

Running the test is straightforward

``` r
library("audit.connect")
check(server = "https://www.connect.server.name/", token = "API_TOKEN")
```

Alternatively, you can set environmental variables, `CONNECT_SERVER` and
`CONNECT_API_KEY` in your `.Renviron` file.

## Connect Package Pollution

If you are running this package on a machine you normally use to deploy
to Connect, then this isn’t an issue - you can skip the next part.

**If** you are using a machine where you are deploying to Connect for
the first time, then read one\!

Connect package pollution occurs when

  - we use package manager binaries, **and**
  - the OS on Connect differs to the OS on the deployment machine.

If you aren’t using binaries or the OS is the same, then you won’t have
any issue. If you want to be sure, we can use {renv}

``` r
# Use a new, empty cache for this project, leaving your own renv cache alone
Sys.setenv(RENV_PATHS_CACHE = tempfile("renv-cache-"))
# Use the slow installation method
renv::init(repo = "https://cloud.r-project.org/")
renv::install("remotes")
```

## Checks

`check()` deploys test content to Connect and deletes it afterwards.
Each check has a group and a name, which are the keys in the config
file.

| Group            | Check                                         | What it does                                                                                 |
| ---------------- | --------------------------------------------- | -------------------------------------------------------------------------------------------- |
| `deploy_git`     | `public-github`                               | Deploys a Shiny app from a public GitHub repository, as Git-backed content                   |
| `deploy_pins`    | `rds`                                         | Writes `mtcars` as an RDS pin, reads it back unchanged, then deletes it                      |
| `deploy_plumber` | `api`                                         | Deploys a Plumber API and checks that its `/echo` endpoint responds                          |
| `deploy_python`  | `flask`                                       | Deploys a Python Flask API with rsconnect-python (skipped if it isn’t installed)             |
| `deploy_python`  | `streamlit`                                   | Deploys a Python Streamlit app with rsconnect-python (skipped if it isn’t installed)         |
| `deploy_python`  | `voila`                                       | Deploys Posit’s Voila example notebook with rsconnect-python (skipped if it isn’t installed) |
| `deploy_shiny`   | `basic_app`                                   | Deploys a basic Shiny app                                                                    |
| `render_quarto`  | `beamer`, `docx`, `html`, `observable`, `pdf` | Deploys a Quarto document to Connect and renders it on the server in that format             |
| `render_quarto`  | `python`                                      | Deploys a Quarto document that uses the Jupyter engine, with rsconnect-python                |
| `render_quarto`  | `rsvg_convert`                                | Deploys a Quarto PDF containing an SVG image, which needs rsvg-convert on Connect            |
| `render_rmd`     | `html`, `pdf`, `word`                         | Deploys an R Markdown document to Connect and renders it on the server in that format        |

`check()` also reports the server details, the Connect version and the
system libraries R packages need, but these aren’t configurable checks.

## Config file

Experimental. You can skip deployment tests, by setting the appropriate
value in `config-uat-rsc.yml`. This file can be auto-generated via

``` r
create_config()
```

If a test is missing in the config, the default value is TRUE.

## Creating a test

Tests are R6 classes. To be automatically detected, the class name
**must** start with `check_`. If you copy/paste the following code into
`R/example.R`, when you run `check()`, the test is automatically
detected and run. Likewise, `create_config()`

``` r
#' @export
check_example = R6::R6Class(
  "check_example",
  inherit = audit.base::base_check,
  # A function is passed to checker()
  # This runs the test, detects errors, and logs the result
  public = list(
    #' @description Runs a UAT check
    check = function(debug_level) {
      private$checker(example_test(), debug_level)
      return(invisible(NULL))
    }
  ),
  # Multiple classes can have the same group.
  # But context/short should be unique
  private = list(
    context = "Human description",
    short = "config_variable",
    group = "config_group",
    long = "A sentence describing what the check does"
  )
)

example_test = function() {
  return(TRUE)
}
```

## Running the tests

`test-check.R` and `test-sanitise.R` deploy test content to the server in `CONNECT_SERVER`, so they
are skipped unless `AUDIT_CONNECT_LIVE` is `true`:

```r
Sys.setenv(AUDIT_CONNECT_LIVE = "true")
devtools::test()
```
