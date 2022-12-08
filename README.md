# jrHealthCheckConnect

<!-- badges: start -->
<!-- badges: end -->

This checks that a variety of applications can be deployed to a Posit Connect Server.

## Installation

To install the R package, run

``` r
install.packages("jrHealthCheckConnect")
```
For python based deployment, the python package, `rsconnect-python` is required

``` bash
pip install rsconnect-python
```

## Usage

Running the test is straightforward

``` r
library("jrHealthCheckConnect")
check(server = "https://rsc.jumpingrivers.cloud/", token = "API_TOKEN")
```
Alternatively, you can set environmental variables, `CONNECT_SERVER` and `CONNECT_API_KEY` in your
`.Renviron` file.

To skip, set the appropriate value in `config-uat.yml`. This file can be auto-generated
via

``` r
create_config()
```
If a test is missing in the config, the default value is TRUE.

## Creating a test

Tests are R6 classes. To be automatically detected, the class name **must**
start with `check_`. If you copy/paste the following code into `R/example.R`,
when you run `check()`, the test is automatically detected and run.
Likewise, `create_config()`

``` r
#' @export
check_example = R6::R6Class(
  "check_example",
  inherit = base_check,
  # A function is passed to checker()
  # This runs the test, detects errors, and logs the result
  public = list(
    #' @description Runs a UAT check
    check = function(account = NULL) {
      private$checker(example_test())
      return(invisible(NULL))
    }
  ),
  # Multiple classes can have the same group.
  # But context/short should be unique
  private = list(
    context = "Human description",
    short = "config_variable",
    group = "config_group"
  )
)

example_test = function() {
  return(TRUE)
}
```
