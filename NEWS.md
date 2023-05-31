# audit.connect 0.4.1 _2023-05-31_
- feat: Quarto report of audit
- feat: Add feature usage
- feat: Include package version in output

# audit.connect 0.4.0 _2023-05-22_
- feat: Move to GitHub and rename pkg

# jrHealthCheckConnect 0.3.11 _2023-05-05_
- feat: Initial sketch of report

# jrHealthCheckConnect 0.3.10 _2023-05-02_
- fix: Ensure that manifests don't use binary repos

# jrHealthCheckConnect 0.3.9 _2023-05-01_
- feat: New test - include svgs with quarto
- chore: New version of uatBase has comments in CSVs
- fix: Delete pins after deployment

# jrHealthCheckConnect 0.3.8 _2023-03-28_
- feat: Use {uatBase} package for inst/

# jrHealthCheckConnect 0.3.7 _2023-03-19_
- feat: Use {uatBase} package

# jrHealthCheckConnect 0.3.6 _2023-03-19_
- feat: Use {serverHeaders} package

# jrHealthCheckConnect 0.3.5 _2023-02-12_
- feat: Update versions

# jrHealthCheckConnect 0.3.4 _2023-02-12_
- feat: Improved config creation

# jrHealthCheckConnect 0.3.3 _2023-02-11_
- feat: Check github deployment

# jrHealthCheckConnect 0.3.2 _2023-02-11_
- feat: Check shiny deployment

# jrHealthCheckConnect 0.3.1 _2023-02-01_
- feat: Improved debugging using `debug_level`

# jrHealthCheckConnect 0.3.0 _2023-01-21_
- style: Standardise deploy titles

# jrHealthCheckConnect 0.2.20 _2023-01-18_
- fix: Pass server/token to plumber test
- fix: Deploying Python quarto content now uses a requirements.txt

# jrHealthCheckConnect 0.2.19 _2023-01-18_
- feat: Summaries RSC user types

# jrHealthCheckConnect 0.2.18 _2023-01-17_
- feat: Highlight old R/Python/Quarto versions

# jrHealthCheckConnect 0.2.17 _2023-01-17_
- feat: Check sys deps to determine which packages can't be installed

# jrHealthCheckConnect 0.2.16 _2023-01-11_
- feat: Check server headers

# jrHealthCheckConnect 0.2.15 _2022-12-29_
- feat: Check RSC version

# jrHealthCheckConnect 0.2.14 _2022-12-29_
- refactor: Remove {jrApiRStudio} dependency

# jrHealthCheckConnect 0.2.13 _2022-12-29_
- fix: Julia isn't possible on connect. So removing test.

# jrHealthCheckConnect 0.2.12 _2022-12-20_
- feat: Add plumber test
- feat: Set config file with default "no"

# jrHealthCheckConnect 0.2.11 _2022-12-20_
- feat: Advance quarto tests: python/Julia/Obser'

# jrHealthCheckConnect 0.2.10 _2022-12-20_
-  feat: quarto test: quarto to beamer
-  fix: individual python tests now use ENV variables
-  fix: Merge conflict broke deploy flask

# jrHealthCheckConnect 0.2.9 _2022-11-07_
-  feat: Perform a basic API call to check token
-  feat: Retrieve and display R/Python/Quarto versions
-  feat: Automatically register account using token
-  chore: Remove additional blank lines / EOL whitespace

# jrHealthCheckConnect 0.2.8 _2022-11-07_
-  feat: Pass tokens & server as arguments

# jrHealthCheckConnect 0.2.7 _2022-10-21_
-  feat: Deploy streamlit applications

# jrHealthCheckConnect 0.2.6 _2022-10-19_

-  feat: Add in quarto to PDF & quarto to docx tests

# jrHealthCheckConnect 0.2.5 _2022-10-18_
-   feat: Summarise key variables at the start of the test

# jrHealthCheckConnect 0.2.4 _2022-10-03_
-   feat: Testing flask APIs

# jrHealthCheckConnect 0.2.3 _2022-10-03_

-   internal: Rename package {connecttest} -> {jrHealthCheckConnect}

# jrHealthCheckConnect 0.2.2 _2022-10-03_
-   feat: Add in quarto test
-   bug: Don't assume a lack of `stop()`, means success
-   refactor: Create standard `cleanup_` functions
-   internal: Change doc -> Word to match {knitr} naming
-   internal: Use the generated .Rmd file from RStudio for tests

# jrHealthCheckConnect 0.2.1 _2022-10-03_
-   feat: Add in pins test

# jrHealthCheckConnect 0.2.0 _2022-09-24_
-   feat: Complete refactoring to use R6 classes

# jrHealthCheckConnect 0.1.0 _2022-09-20_

-   Adds tests for deployment of Rmd files as PDFs and Word documents, knitted on Connect server

# jrHealthCheckConnect 0.0.3 _2022-09-20_

-   Removes unused imports

# jrHealthCheckConnect 0.0.2 _2022-09-16_

-   Added test which deploys an RMarkdown file to Connect
-   Updated DESCRIPTION

# jrHealthCheckConnect 0.0.1 _2021-01-01_

-   Initial commit
