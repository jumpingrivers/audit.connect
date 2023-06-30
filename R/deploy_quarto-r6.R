#' @rawNamespace export(check_deploy_quarto_beamer)
#' @rawNamespace export(check_deploy_quarto_docx)
#' @rawNamespace export(check_deploy_quarto_html)
#' @rawNamespace export(check_deploy_quarto_observable)
#' @rawNamespace export(check_deploy_quarto_pdf)
#' @rawNamespace export(check_deploy_quarto_rsvg_convert)
NULL
types = c("beamer", "docx", "html", "observable", "pdf", "rsvg_convert")
longs = paste0("Checking that quarto can render a document (type: `", types, "`)")
longs[6] = "Checking that quarto can render SVG image within a PDF"
for (i in seq_along(types)) {

  assign(
    paste0("check_deploy_quarto_", types[i]),
    R6::R6Class(
      paste0("check_deploy_quarto_", types[i]),
      inherit = audit.base::base_check,
      public = list(
        check = function(debug_level, account = NULL) {
          quarto_dir = system.file("extdata", private$group, private$short,
                                   package = "audit.base", mustWork = TRUE)
          private$checker(
            deploy_quarto(quarto_dir, account, debug_level = debug_level))

          return(invisible(NULL))
        }
      ),
      private = list(
        context = paste("Deploying", types[i]),
        short = types[i],
        group = "render_quarto",
        long = longs[i]
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
#' @aliases check_deploy_quarto_rsvg_convert
#' @export
check_deploy_quarto_python = R6::R6Class(
  "check_deploy_quarto_python",
  inherit = audit.base::base_check,
  public = list(
    #' @description Checks deployment of Quarto document with PDF output
    #' @param account Connect username
    #' @param debug_level See check() for details
    check = function(debug_level, account = NULL) {
      if (is.null(account)) account = get_username()
      python_dir = system.file("extdata", private$group, private$short,
                               package = "audit.base", mustWork = TRUE)
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
