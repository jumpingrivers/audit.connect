#' R6 classes
#'
#' Check classes
#' @export
check_deploy_python_flask = R6::R6Class(
  "check_deploy_python_flask",
  inherit = audit.base::base_check,
  public = list(
    #' @description Checks deployment of Quarto document with HTML output
    #' @param debug_level See check() for details
    check = function(debug_level) {
      if (isFALSE(.connect$rsconnect_python)) {
        cli::cli_alert_info("rsconnect-python missing. Skipping Python test.")
        invisible(NULL)
      }
      python_dir = system.file(
        "extdata",
        private$group,
        private$short,
        package = "audit.connect",
        mustWork = TRUE
      )
      private$checker(deploy_python(
        python_dir,
        python_files = "app.py",
        rsconnect_type = "api",
        debug_level = debug_level
      ))
      invisible(NULL)
    }
  ),
  private = list(
    context = "Deploy flask app",
    short = "flask",
    group = "deploy_python",
    long = "Deploy a Python flask application"
  )
)
