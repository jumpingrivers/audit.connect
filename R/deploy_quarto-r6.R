#' @rawNamespace export(check_deploy_quarto_beamer)
#' @rawNamespace export(check_deploy_quarto_docx)
#' @rawNamespace export(check_deploy_quarto_html)
#' @rawNamespace export(check_deploy_quarto_observable)
#' @rawNamespace export(check_deploy_quarto_pdf)
NULL
types = c("beamer", "docx", "html", "observable", "pdf")
for (type in types) {

  assign(
    paste0("check_deploy_quarto_", type),
    R6::R6Class(
      paste0("check_deploy_quarto_", type),
      inherit = uatBase::base_check,
      public = list(
        check = function(debug_level, account = NULL) {
          quarto_dir = system.file("extdata", private$group, private$short,
                                   package = "uatBase", mustWork = TRUE)
          private$checker(
            deploy_quarto(quarto_dir, account, debug_level = debug_level))

          return(invisible(NULL))
        }
      ),
      private = list(
        context = paste("Deploying", type),
        short = type,
        group = "render_quarto"
      )
    )
  )
}

#' R6 classes
#'
#' Check classes.
#' @details We use the deploy_python() mechanism for this quarto document, as
#' we need to specify the requirements.txt file
#' @aliases check_deploy_quarto_beamer check_deploy_quarto_docx
#' @aliases check_deploy_quarto_html check_deploy_quarto_observable
#' @aliases check_deploy_quarto_pdf
#' @aliases check_deploy_rmd_html check_deploy_rmd_pdf check_deploy_rmd_word
#' @export
check_deploy_quarto_python = R6::R6Class(
  "check_deploy_quarto_python",
  inherit = uatBase::base_check,
  public = list(
    #' @description Checks deployment of Quarto document with PDF output
    #' @param account Connect username
    #' @param debug_level See check() for details
    check = function(debug_level, account = NULL) {
      if (is.null(account)) account = get_username()
      python_dir = system.file("extdata", private$group, private$short,
                               package = "uatBase", mustWork = TRUE)
      private$checker(
        deploy_python(python_dir,
                      python_files = "index.qmd",
                      rsconnect_type = "quarto",
                      debug_level = debug_level))
      return(invisible(NULL))
    }
  ),
  private = list(
    context = "Jupyter engine",
    short = "python",
    group = "render_quarto"
  )
)
