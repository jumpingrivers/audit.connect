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
