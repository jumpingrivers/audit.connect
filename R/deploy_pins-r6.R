#' R6 classes
#'
#' Check classes
#' @export
check_deploy_pins_rds = R6::R6Class(
  "check_deploy_pins_rds",
  inherit = audit.base::base_check,
  public = list(
    #' @description Checks a pin can be written, read and deleted
    #' @param debug_level See check() for details
    check = function(debug_level) {
      private$checker(deploy_pins(debug_level = debug_level))
      invisible(NULL)
    }
  ),
  private = list(
    context = "Read, write & delete pins",
    short = "rds",
    group = "deploy_pins",
    long = "Deploy pin and download pins"
  )
)
