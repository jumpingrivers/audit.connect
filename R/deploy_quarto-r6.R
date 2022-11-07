#' R6 classes
#'
#' Check classes
#' @export
check_deploy_quarto_html = R6::R6Class(
  "check_deploy_quarto_html",
  inherit = base_check,
  public = list(
    #' @description Checks deployment of Quarto document with HTML output
    check = function() {
      quarto_dir = system.file("extdata", private$group, private$short,
                               package = "jrHealthCheckConnect", mustWork = TRUE)
      private$checker(deploy_quarto(quarto_dir))
      return(invisible(NULL))
    }
  ),
  private = list(
    context = "qmd to HTML deployment",
    short = "html",
    group = "deploy_quarto"
  )
)

#' R6 classes
#'
#' Check classes
#' @export
check_deploy_quarto_docx = R6::R6Class(
  "check_deploy_quarto_docx",
  inherit = base_check,
  public = list(
    #' @description Checks deployment of Quarto document with Docx output
    check = function() {
      quarto_dir = system.file("extdata", private$group, private$short,
                               package = "jrHealthCheckConnect", mustWork = TRUE)
      private$checker(deploy_quarto(quarto_dir))
      return(invisible(NULL))
    }
  ),
  private = list(
    context = "qmd to docx deployment",
    short = "docx",
    group = "deploy_quarto"
  )
)

#' R6 classes
#'
#' Check classes
#' @export
check_deploy_quarto_pdf = R6::R6Class(
  "check_deploy_quarto_pdf",
  inherit = base_check,
  public = list(
    #' @description Checks deployment of Quarto document with PDF output
    check = function() {
      quarto_dir = system.file("extdata", private$group, private$short,
                               package = "jrHealthCheckConnect", mustWork = TRUE)
      private$checker(deploy_quarto(quarto_dir))
      return(invisible(NULL))
    }
  ),
  private = list(
    context = "qmd to PDF deployment",
    short = "pdf",
    group = "deploy_quarto"
  )
)