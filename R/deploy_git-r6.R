#' R6 classes
#'
#' Check classes
#' @export
check_deploy_github = R6::R6Class(
  "check_deploy_github",
  inherit = audit.base::base_check,
  public = list(
    #' @description Deploy a shiny application from github
    #' @param debug_level See check() for details
    check = function(debug_level) {
      private$checker(deploy_git(
        repository = "https://github.com/uat-examples/old-faithful",
        debug_level = debug_level,
        title = paste("UAT", private$short)
      ))
      invisible(NULL)
    }
  ),
  private = list(
    context = "Old Faithful",
    short = "public-github",
    group = "deploy_git",
    long = "Deploy a Shiny application via github.com"
  )
)
