#' R6 classes
#'
#' Check classes
#' @export
check_deploy_rmd_pdf = R6::R6Class(
  "check_deploy_rmd_pdf",
  inherit = base_check,
  public = list(
    #' @description Checks deployment of an R Markdown document with PDF output
    check = function() {
      rmd_dir = system.file("extdata", private$group, private$short,
                            package = "jrHealthCheckConnect", mustWork = TRUE)
      private$checker(deploy_rmd(rmd_dir))
      return(invisible(NULL))
    }
  ),
  private = list(
    context = "Rmd to PDF deployment",
    short = "pdf",
    group = "deploy_rmd"
  )
)

#' @rdname check_deploy_rmd_pdf
#' @export
check_deploy_rmd_html = R6::R6Class(
  "check_deploy_rmd_html",
  inherit = base_check,
  public = list(
    #' @description Checks deployment of an R Markdown document with HTML output
    check = function() {
      rmd_dir = system.file("extdata", private$group, private$short,
                            package = "jrHealthCheckConnect", mustWork = TRUE)
      private$checker(deploy_rmd(rmd_dir))
      return(invisible(NULL))
    }
  ),
  private = list(
    context = "Rmd to HTML deployment",
    short = "html",
    group = "deploy_rmd"
  )
)

#' @rdname check_deploy_rmd_pdf
#' @export
check_deploy_rmd_doc = R6::R6Class(
  "check_deploy_rmd_word",
  inherit = base_check,
  public = list(
    #' @description  Checks deployment of an R Markdown document with Word Docx output
    check = function() {
      rmd_dir = system.file("extdata", private$group, private$short,
                            package = "jrHealthCheckConnect", mustWork = TRUE)
      private$checker(deploy_rmd(rmd_dir))
      return(invisible(NULL))
    }
  ),
  private = list(
    context = "Rmd to Word deployment",
    short = "word",
    group = "deploy_rmd"
  )
)
