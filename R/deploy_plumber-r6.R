#' R6 classes
#'
#' Check classes
#' @export
check_deploy_plumber_api = R6::R6Class(
  "check_deploy_pluumber_api",
  inherit = audit.base::base_check,
  public = list(
    #' @description Checks deployment of a Plumber API
    #' @param debug_level See check() for details
    check = function(debug_level) {
      plumber_dir = system.file(
        "extdata",
        private$group,
        package = "audit.connect",
        mustWork = TRUE
      )
      private$checker(deploy_plumber(plumber_dir, debug_level = debug_level))
      invisible(NULL)
    }
  ),
  private = list(
    context = "Plumber API deployment",
    short = "api",
    group = "deploy_plumber",
    long = "Deploy and connect to a basic plummer endpoint"
  )
)
