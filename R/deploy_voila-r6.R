#' R6 classes
#'
#' Check classes
#' @export
check_deploy_python_voila = R6::R6Class(
  "check_deploy_python_voila",
  inherit = audit.base::base_check,
  public = list(
    #' @description Checks deployment of a Voila notebook
    #' @param debug_level See check() for details
    check = function(debug_level) {
      if (skip_without_rsconnect_python(self)) {
        return(invisible(NULL))
      }
      python_dir = system.file(
        "extdata",
        private$group,
        private$short,
        package = "audit.connect",
        mustWork = TRUE
      )
      private$checker(
        deploy_python(
          python_dir,
          python_files = "hash.ipynb",
          rsconnect_type = "voila",
          debug_level = debug_level
        ),
        debug_level
      )
      invisible(NULL)
    }
  ),
  private = list(
    context = "Deploy Voila notebook",
    short = "voila",
    group = "deploy_python",
    long = "Deploys Posit's Voila example notebook with rsconnect-python
    (skipped if it isn't installed)"
  )
)
