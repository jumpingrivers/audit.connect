#' R6 classes
#'
#' Check classes
#' @export
check_deploy_python_flask = R6::R6Class(
  "check_deploy_python_flask",
  inherit = base_check,
  public = list(
    #' @description Checks deployment of Quarto document with HTML output
    check = function() {
      if (isFALSE(.connect$rsconnect_python)) {
        cli::cli_alert_info("rsconnect-python missing. Skipping Python test.")
        return(invisible(NULL))
      }
      python_dir = system.file("extdata", private$group, private$short,
                               package = "jrHealthCheckConnect", mustWork = TRUE)
      private$checker(deploy_python(python_dir,
                                    python_files = "app.py",
                                    rsconnect_type = "api"))
      return(invisible(NULL))
    }
  ),
  private = list(
    context = "Deploy flask app",
    short = "flask",
    group = "deploy_python"
  )
)
