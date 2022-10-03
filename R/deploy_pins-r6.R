#' R6 classes
#'
#' Check classes
#' @export
check_deploy_pins_rds = R6::R6Class(
  "check_deploy_pins_rds",
  inherit = base_check,
  public = list(
    #' @description Checks a pin can be written, read and deleted
    check = function() {
      private$checker(deploy_pins())
      return(invisible(NULL))
    }
  ),
  private = list(
    context = "Read, write & delete pins",
    short = "rds",
    group = "deploy_pins"
  )
)
