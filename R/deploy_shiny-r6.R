#' R6 classes
#'
#' Check classes
#' @export
check_deploy_shiny = R6::R6Class(
  "check_deploy_shiny",
  inherit = audit.base::base_check,
  public = list(
    #' @description  Checks deployment of an R Markdown document with Word Docx output
    #' @param debug_level See check() for details
    check = function(debug_level) {
      shiny_dir = system.file("extdata", private$group, private$short,
                              package = "audit.connect", mustWork = TRUE)
      private$checker(deploy_app(shiny_dir, debug_level, appFiles = "app.R"))
      return(invisible(NULL))
    }
  ),
  private = list(
    context = "Deploy basic app",
    short = "basic_app",
    group = "deploy_shiny",
    long = "Deploy a basic Shiny application"
  )
)
