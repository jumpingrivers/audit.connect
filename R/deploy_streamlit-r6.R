#' R6 classes
#'
#' Check classes
#' @export
check_deploy_python_streamlit = R6::R6Class(
  "check_deploy_python_streamlit",
  inherit = base_check,
  public = list(
    #' @description Checks deployment of Python Streamlit app
    check = function() {
      if (isFALSE(.connect$rsconnect_python)) {
        cli::cli_alert_info("rsconnect-python missing. Skipping Python test.")
        return(invisible(NULL))
      }
      python_dir = system.file("extdata", private$group, private$short,
                        package = "jrHealthCheckConnect", mustWork = TRUE)
      private$checker(deploy_python(python_dir, rsconnect_type = "streamlit"))
      return(invisible(NULL))
    }
  ),
  private = list(
    context = "Deploy streamlit app",
    short = "streamlit",
    group = "deploy_python"
  )
)
