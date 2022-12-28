#' R6 classes
#'
#' Check classes
#' @export
check_deploy_plumber_api = R6::R6Class(
  "check_deploy_pluumber_api",
  inherit = base_check,
  public = list(
    #' @description Checks deployment of a Plumber API
    check = function() {
      plumber_dir = system.file("extdata", private$group,
                                package = "jrHealthCheckConnect", mustWork = TRUE)
      private$checker(deploy_plumber(plumber_dir))
      return(invisible(NULL))
    }
  ),
  private = list(
    context = "Plumber API deployment",
    short = "api",
    group = "deploy_plumber"
  )
)
