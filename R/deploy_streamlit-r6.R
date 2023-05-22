#' R6 classes
#'
#' Check classes
#' @export
check_deploy_python_streamlit = R6::R6Class(
  "check_deploy_python_streamlit",
  inherit = audit.base::base_check,
  public = list(
    #' @description Checks deployment of Python Streamlit app
    #' @param debug_level See check() for details
    check = function(debug_level) {
      if (isFALSE(.connect$rsconnect_python)) {
        cli::cli_alert_info("rsconnect-python missing. Skipping Python test.")
        return(invisible(NULL))
      }
      python_dir = system.file("extdata", private$group, private$short,
                        package = "audit.connect", mustWork = TRUE)
      private$checker(deploy_python(python_dir,
                                    python_files = "app.py",
                                    rsconnect_type = "streamlit",
                                    debug_level = debug_level))
      return(invisible(NULL))
    }
  ),
  private = list(
    context = "Deploy streamlit app",
    short = "streamlit",
    group = "deploy_python"
  )
)
