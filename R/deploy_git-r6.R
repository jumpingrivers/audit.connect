#' R6 classes
#'
#' Check classes
#' @export
check_deploy_github = R6::R6Class(
  "check_deploy_github",
  inherit = base_check,
  public = list(
    #' @description Checks deployment of an R Markdown document with PDF output
    #' @param debug_level See check() for details
    check = function(debug_level) {
      private$checker(deploy_git(repository = "https://github.com/uat-examples/old-faithful",
                                 debug_level = debug_level,
                                 title = paste("UAT", private$short)))
      return(invisible(NULL))
    }
  ),
  private = list(
    context = "Old Faithful",
    short = "public-github",
    group = "deploy_git"
  )
)
