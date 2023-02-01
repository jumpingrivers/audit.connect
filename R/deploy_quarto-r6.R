#' R6 classes
#'
#' Check classes
#' @export
check_deploy_quarto_html = R6::R6Class(
  "check_deploy_quarto_html",
  inherit = base_check,
  public = list(
    #' @description Checks deployment of Quarto document with HTML output
    #' @param account Connect username
    #' @param debug_level See check() for details
    check = function(debug_level, account = NULL) {
      if (is.null(account)) account = get_username()
      quarto_dir = system.file("extdata", private$group, private$short,
                               package = "jrHealthCheckConnect", mustWork = TRUE)
      private$checker(deploy_quarto(quarto_dir, account = account, debug_level = debug_level))
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
    #' @param account Connect username
    #' @param debug_level See check() for details
    check = function(debug_level, account = NULL) {
      if (is.null(account)) account = get_username()
      quarto_dir = system.file("extdata", private$group, private$short,
                               package = "jrHealthCheckConnect", mustWork = TRUE)
      private$checker(deploy_quarto(quarto_dir, account = account, debug_level = debug_level))
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
    #' @param account Connect username
    #' @param debug_level See check() for details
    check = function(debug_level, account = NULL) {
      if (is.null(account)) account = get_username()
      quarto_dir = system.file("extdata", private$group, private$short,
                               package = "jrHealthCheckConnect", mustWork = TRUE)
      private$checker(deploy_quarto(quarto_dir, account = account, debug_level = debug_level))
      return(invisible(NULL))
    }
  ),
  private = list(
    context = "qmd to PDF deployment",
    short = "pdf",
    group = "deploy_quarto"
  )
)

#' R6 classes
#'
#' Check classes
#' @export
check_deploy_quarto_beamer = R6::R6Class(
  "check_deploy_quarto_beamer",
  inherit = base_check,
  public = list(
    #' @description Checks deployment of Quarto document with beamer output
    #' @param account Connect username
    #' @param debug_level See check() for details
    check = function(debug_level, account = NULL) {
      if (is.null(account)) account = get_username()
      quarto_dir = system.file("extdata", private$group, private$short,
                               package = "jrHealthCheckConnect", mustWork = TRUE)
      private$checker(deploy_quarto(quarto_dir, account = account, debug_level = debug_level))
    }
  ),
  private = list(
    context = "qmd to beamer deployment",
    short = "beamer",
    group = "deploy_quarto"
  )
)

#' R6 classes
#'
#' Check classes.
#' @details We use the deploy_python() mechanism for this quarto document, as
#' we need to specify the requirements.txt file
#' @export
check_deploy_quarto_python = R6::R6Class(
  "check_deploy_quarto_python",
  inherit = base_check,
  public = list(
    #' @description Checks deployment of Quarto document with PDF output
    #' @param account Connect username
    #' @param debug_level See check() for details
    check = function(debug_level, account = NULL) {
      if (is.null(account)) account = get_username()
      python_dir = system.file("extdata", private$group, private$short,
                               package = "jrHealthCheckConnect", mustWork = TRUE)
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
    group = "deploy_quarto"
  )
)

#' R6 classes
#'
#' Check classes
#' @export
check_deploy_quarto_observable = R6::R6Class(
  "check_deploy_quarto_observable",
  inherit = base_check,
  public = list(
    #' @description Checks deployment of Quarto document with PDF output
    #' @param account Connect username
    #' @param debug_level See check() for details
    check = function(debug_level, account = NULL) {
      if (is.null(account)) account = get_username()
      quarto_dir = system.file("extdata", private$group, private$short,
                               package = "jrHealthCheckConnect", mustWork = TRUE)
      private$checker(deploy_quarto(quarto_dir, account = account, debug_level = debug_level))
      return(invisible(NULL))
    }
  ),
  private = list(
    context = "observable deployment",
    short = "observable",
    group = "deploy_quarto"
  )
)
