#' @rawNamespace export(check_deploy_rmd_html)
#' @rawNamespace export(check_deploy_rmd_pdf)
#' @rawNamespace export(check_deploy_rmd_word)
NULL
types = c("html", "pdf", "word")
for (type in types) {
  assign(
    paste0("check_deploy_rmd_", type),
    R6::R6Class(
      paste0("check_deploy_rmd_", type),
      inherit = audit.base::base_check,
      public = list(
        check = function(debug_level) {
          rmd_dir = system.file("extdata", private$group, private$short,
                                package = "audit.base", mustWork = TRUE)
          private$checker(
            deploy_app(rmd_dir, debug_level = debug_level))

          return(invisible(NULL))
        }
      ),
      private = list(
        context = paste("Deploying", type),
        short = type,
        group = "render_rmd",
        long = paste0("Checking that Rmarkdown can render a document (type: `", type, "`)")
      )
    )
  )
}
