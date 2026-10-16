# audit.connect 0.8.9

## Bug fixes and minor improvements

* Any exported class whose name starts with `check_` is run as a check, as the README says. Before, only `check_deploy*` classes were (#72).
* `check()` prints the user summary once (#72).
* The Git-backed check deploys with its own title, so its content is deleted afterwards (#72).
* Python clean-up deletes only content owned by the auditor (#72).
* The report's old-users table lists users who have never logged in. Users inactive for exactly 6 or 12 months are no longer left out (#72).
* The README's renv advice uses a temporary cache, instead of deleting the user's whole renv cache (#72).

# audit.connect 0.8.8

## Bug fixes and minor improvements

* `report.qmd` renders on licensed servers. The summary stores how much content each locked user owns, not the full content list (#64).
* The Python checks are reported as skipped when rsconnect-python is missing, instead of two failing and two being left out (#65).
* The API key is passed to rsconnect-python through `CONNECT_API_KEY`, not on the command line, and the rsconnect account that holds it is kept in a temporary folder (#66).

# audit.connect 0.8.7

## Bug fixes and minor improvements

* The tests that deploy to `CONNECT_SERVER` only run when `AUDIT_CONNECT_LIVE` is `true`, so `devtools::test()` no longer deploys to whichever server is set (#68).

# audit.connect 0.8.6

## Bug fixes and minor improvements

* `check()` says "CONNECT_API_KEY missing" when the key is unset, instead of "missing value where TRUE/FALSE needed" (#71).

# audit.connect 0.8.5

## New features

* `check_deploy_python_voila` deploys Posit's "Secure Hashes with Voilà" example notebook with rsconnect-python (#44).

## Bug fixes and minor improvements

* Python deploys let Connect choose any Python 3.10 or later, instead of asking for the auditor's own version, which the server may not have. Requires audit.base 0.7.2 for the Quarto Python check.

# audit.connect 0.8.4

## Bug fixes and minor improvements

* A failed Python deploy test no longer leaves empty content on Connect. The cleanup finds the content by title, whether or not the deploy succeeded (#60).

# audit.connect 0.8.3

## New features

* `check()` reports whether R on the Connect server can determine its timezone. The system dependency endpoint reads it on Connect, and the report includes the result (#54).

# audit.connect 0.8.2

## Bug fixes and minor improvements

* The system dependency check reads `/etc/os-release` to detect Red Hat and CentOS, so other Linux distributions are reported as unsupported rather than treated as Red Hat (#55).
* A test checks that every bundled `manifest.json` checksum matches its file.

# audit.connect 0.8.1

## Bug fixes and minor improvements

* The Flask and Streamlit deploy tests install on Python 3.14. Their `requirements.txt` files list only the packages each app imports, with lower bounds instead of exact pins, and the Streamlit app uses `st.cache_data` in place of the removed `st.cache` (#56).

# audit.connect 0.8.0

## Breaking changes

* Requires R 4.1.0 or later, as the package now uses the native pipe `|>`.

## Bug fixes and minor improvements

* Requires connectapi 0.12.1 and rsconnect 1.10.0 or later.
* `check()` passes named arguments to `summarise_users()`.
* The Plumber test API's manifest checksum matches its `plumber.R`.

# audit.connect 0.7.15

## Bug fixes and minor improvements

* `air.toml` was empty, so air rewrote `=` to `<-`. It now sets `=` assignment and 100-character lines.

# audit.connect 0.7.14

## Bug fixes and minor improvements

* Each check's description says what it deploys and when it passes, and the README lists the checks with their config keys (#18).

# audit.connect 0.7.13

## Bug fixes and minor improvements

* rsconnect-python is found when it isn't on R's `PATH`. The audit looks at `RSCONNECT_PATH`, then `PATH`, then `~/.local/bin` (#37).

# audit.connect 0.7.12

## Bug fixes and minor improvements

* The Plumber API and system dependency test deployments are deleted from Connect after a run (#31).

# audit.connect 0.7.11

## Bug fixes and minor improvements

* README now installs the package from GitHub, as it isn't on CRAN (#38).

# audit.connect 0.7.10

## Bug fixes and minor improvements

* Issues now use the Jumping Rivers organisation templates.

# audit.connect 0.7.9 _2026-05-25_
  - chore: Update Python requirements
  - chore: Update manifest files to R 4.4.3
  - chore: Bump audit.base dependency to >= 0.6.27
  - docs: Use uv pip in README

# audit.connect 0.7.8 _2026-03-11_
  - fix: Pass debug_level
  - fix: Use magrittr pipe for compatibility with older R versions.

# audit.connect 0.7.7 _2025-07-16_
  - chore: Update requirements.txt

# audit.connect 0.7.6 _2025-07-16_
  - chore: Formatting using air
  - chore: Update linting

# audit.connect 0.7.5 _2024-07-24_
  - fix: Remove feature usage - experimental API no longer works

# audit.connect 0.7.5 _2024-06-10_
  - fix: Use latest version of {connactapi}
  - chore: Fix Rd warnings due to R4.4
  - fix: #15

# audit.connect 0.7.4 _2024-04-04_
  - feat: Force `server` to have `http(?s)`
  - feat: Improved error message when testing status response

# audit.connect 0.7.3 _2024-03-27_
  - fix: Remove additional / from user api call

# audit.connect 0.7.2 _2024-01-24_
  - fix: If NA, return 0 locked apps

# audit.connect 0.7.1 _2023-12-05_
  - fix: If plumber deployment fails, handle failure gracefully

# audit.connect 0.7.0 _2023-10-18_
 - feat: `audit_object |> audit.connect::sanitize()` removes personal user data
 - feat: Add in user URL when summarising users

# audit.connect 0.6.4 _2023-10-01_
 - feat: Check for Posit name leakage

# audit.connect 0.6.3 _2023-09-23_
- feat: Be less picky with server URLs
- fix: Deploy multiple files
- feat: Improve cli output - "All checks complete"

# audit.connect 0.6.2 _2023-09-23_
- fix: Checking system libs

# audit.connect 0.6.1 _2023-08-08_
- fix: Skip user check on evaluation licenses

# audit.connect 0.6.0 _2023-07-02_
- feat: Add in long string context to checks

# audit.connect 0.5.2 _2023-06-26_
- fix: Typo in report.qmd

# audit.connect 0.5.1 _2023-06-24_
- feat: Remove API keys from app call. Don't need; don't want them.

# audit.connect 0.5.0 _2023-06-11_
- refactor: Move standard functions to audit.base

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
