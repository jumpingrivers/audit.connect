---
title: "Posit Connect Audit"
format: 
  html:
    self-contained: true
    theme: flatly
    keep-md: true
editor_options:
  chunk_output_type: console
params:
  input: "~/auditconnect.rds"
---



<!--IMPORTANT:
This is a working draft.
As I've worked through the sections, I spot where the check() output could be tweaked to
provide a better report.

As such, this report will change!
Consider this a rough draft, that you are able to view :)

Yes, I know the code is horrible - see above comments :)
--->


::: {.cell}

:::


## Overview  (rs-connect.utahtech.edu)

This audit was run by Colin gillespie Colin gillespie (<afl_gillesp@utahtech.edu>), using {audit.connect} R package (version 0.5.0). The account level was administrator.

Your Posit product is out of date (v2022.10.0).
There are 10 newer versions that fix 22 CVEs.
The latest vesion is v2023.05.0


## Server Headings

This audit examines the server headings of the Posit Connect (or the server sitting in front of Connect).
It is important to note, that there may be cases where you may want to deviate from setting these
headings. However, this is the exception and not the rule. 
The headings listed below follow the recommendations of securityheaders.com and (to a certain extent)
Mozilla. Where the heading has not been set, we provide links to documentation.


::: {.cell}
::: {.cell-output-display}

```{=html}
<div id="vifvgnlejw" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#vifvgnlejw .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#vifvgnlejw .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#vifvgnlejw .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#vifvgnlejw .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#vifvgnlejw .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#vifvgnlejw .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#vifvgnlejw .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#vifvgnlejw .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#vifvgnlejw .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#vifvgnlejw .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#vifvgnlejw .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#vifvgnlejw .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#vifvgnlejw .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}

#vifvgnlejw .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#vifvgnlejw .gt_from_md > :first-child {
  margin-top: 0;
}

#vifvgnlejw .gt_from_md > :last-child {
  margin-bottom: 0;
}

#vifvgnlejw .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#vifvgnlejw .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#vifvgnlejw .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#vifvgnlejw .gt_row_group_first td {
  border-top-width: 2px;
}

#vifvgnlejw .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#vifvgnlejw .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#vifvgnlejw .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#vifvgnlejw .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#vifvgnlejw .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#vifvgnlejw .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#vifvgnlejw .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#vifvgnlejw .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#vifvgnlejw .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#vifvgnlejw .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-left: 4px;
  padding-right: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#vifvgnlejw .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#vifvgnlejw .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#vifvgnlejw .gt_left {
  text-align: left;
}

#vifvgnlejw .gt_center {
  text-align: center;
}

#vifvgnlejw .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#vifvgnlejw .gt_font_normal {
  font-weight: normal;
}

#vifvgnlejw .gt_font_bold {
  font-weight: bold;
}

#vifvgnlejw .gt_font_italic {
  font-style: italic;
}

#vifvgnlejw .gt_super {
  font-size: 65%;
}

#vifvgnlejw .gt_footnote_marks {
  font-style: italic;
  font-weight: normal;
  font-size: 75%;
  vertical-align: 0.4em;
}

#vifvgnlejw .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#vifvgnlejw .gt_indent_1 {
  text-indent: 5px;
}

#vifvgnlejw .gt_indent_2 {
  text-indent: 10px;
}

#vifvgnlejw .gt_indent_3 {
  text-indent: 15px;
}

#vifvgnlejw .gt_indent_4 {
  text-indent: 20px;
}

#vifvgnlejw .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Header">Header</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Information">Information</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <th colspan="2" class="gt_group_heading" scope="colgroup" id="To investigate">To investigate</th>
    </tr>
    <tr class="gt_row_group_first"><td headers="To investigate  header" class="gt_row gt_left">content-security-policy</td>
<td headers="To investigate  message" class="gt_row gt_left"><div style='line-height:14px'><span style='font-weight:normal;font-variant:normal;color:#1A1A1A;font-size:14px'>Header not set <a href="https://infosec.mozilla.org/guidelines/web_security#content-security-policy">(docs)</a></div>
<div style='line-height:10px'><span style ='font-weight:normal;color:#7F7F7F;font-size:10px'>-</span></div></td></tr>
    <tr><td headers="To investigate  header" class="gt_row gt_left">permissions-policy</td>
<td headers="To investigate  message" class="gt_row gt_left"><div style='line-height:14px'><span style='font-weight:normal;font-variant:normal;color:#1A1A1A;font-size:14px'>Header not set <a href="https://scotthelme.co.uk/goodbye-feature-policy-and-hello-permissions-policy/">(docs)</a></div>
<div style='line-height:10px'><span style ='font-weight:normal;color:#7F7F7F;font-size:10px'>-</span></div></td></tr>
    <tr><td headers="To investigate  header" class="gt_row gt_left">referrer-policy</td>
<td headers="To investigate  message" class="gt_row gt_left"><div style='line-height:14px'><span style='font-weight:normal;font-variant:normal;color:#1A1A1A;font-size:14px'>Header not set <a href="https://infosec.mozilla.org/guidelines/web_security#referrer-policy">(docs)</a></div>
<div style='line-height:10px'><span style ='font-weight:normal;color:#7F7F7F;font-size:10px'>-</span></div></td></tr>
    <tr><td headers="To investigate  header" class="gt_row gt_left">strict-transport-security</td>
<td headers="To investigate  message" class="gt_row gt_left"><div style='line-height:14px'><span style='font-weight:normal;font-variant:normal;color:#1A1A1A;font-size:14px'>max_age present, but suggested value is 1 year <a href="https://infosec.mozilla.org/guidelines/web_security#http-strict-transport-security">(docs)</a></div>
<div style='line-height:10px'><span style ='font-weight:normal;color:#7F7F7F;font-size:10px'>max-age=2592000</span></div></td></tr>
    <tr class="gt_group_heading_row">
      <th colspan="2" class="gt_group_heading" scope="colgroup" id="Looks good">Looks good</th>
    </tr>
    <tr class="gt_row_group_first"><td headers="Looks good  header" class="gt_row gt_left">x-content-type-options</td>
<td headers="Looks good  message" class="gt_row gt_left"><div style='line-height:14px'><span style='font-weight:normal;font-variant:normal;color:#1A1A1A;font-size:14px'>Acceptable setting found <a href="https://infosec.mozilla.org/guidelines/web_security#x-content-type-options">(docs)</a></div>
<div style='line-height:10px'><span style ='font-weight:normal;color:#7F7F7F;font-size:10px'>nosniff</span></div></td></tr>
    <tr><td headers="Looks good  header" class="gt_row gt_left">x-frame-options</td>
<td headers="Looks good  message" class="gt_row gt_left"><div style='line-height:14px'><span style='font-weight:normal;font-variant:normal;color:#1A1A1A;font-size:14px'>Acceptable setting found <a href="https://infosec.mozilla.org/guidelines/web_security#x-frame-options">(docs)</a></div>
<div style='line-height:10px'><span style ='font-weight:normal;color:#7F7F7F;font-size:10px'>DENY</span></div></td></tr>
  </tbody>
  
  
</table>
</div>
```

:::
:::


## Connect Users 


::: {.cell}

:::


Standard security practice is to remove users that are no longer in your organisation.
While we can't detect these users, a useful proxy is to detect registered users
who have not accessed the system in a significant time.

This Connect server is licenced for 150 users.


::: {.cell}
::: {.cell-output-display}

```{=html}
<div id="jqcderovvp" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#jqcderovvp .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#jqcderovvp .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#jqcderovvp .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#jqcderovvp .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#jqcderovvp .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#jqcderovvp .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#jqcderovvp .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#jqcderovvp .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#jqcderovvp .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#jqcderovvp .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#jqcderovvp .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#jqcderovvp .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#jqcderovvp .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}

#jqcderovvp .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#jqcderovvp .gt_from_md > :first-child {
  margin-top: 0;
}

#jqcderovvp .gt_from_md > :last-child {
  margin-bottom: 0;
}

#jqcderovvp .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#jqcderovvp .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#jqcderovvp .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#jqcderovvp .gt_row_group_first td {
  border-top-width: 2px;
}

#jqcderovvp .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#jqcderovvp .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#jqcderovvp .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#jqcderovvp .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#jqcderovvp .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#jqcderovvp .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#jqcderovvp .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#jqcderovvp .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#jqcderovvp .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#jqcderovvp .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-left: 4px;
  padding-right: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#jqcderovvp .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#jqcderovvp .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#jqcderovvp .gt_left {
  text-align: left;
}

#jqcderovvp .gt_center {
  text-align: center;
}

#jqcderovvp .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#jqcderovvp .gt_font_normal {
  font-weight: normal;
}

#jqcderovvp .gt_font_bold {
  font-weight: bold;
}

#jqcderovvp .gt_font_italic {
  font-style: italic;
}

#jqcderovvp .gt_super {
  font-size: 65%;
}

#jqcderovvp .gt_footnote_marks {
  font-style: italic;
  font-weight: normal;
  font-size: 75%;
  vertical-align: 0.4em;
}

#jqcderovvp .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#jqcderovvp .gt_indent_1 {
  text-indent: 5px;
}

#jqcderovvp .gt_indent_2 {
  text-indent: 10px;
}

#jqcderovvp .gt_indent_3 {
  text-indent: 15px;
}

#jqcderovvp .gt_indent_4 {
  text-indent: 20px;
}

#jqcderovvp .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Last Log In">Last Log In</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="User Email">User Email</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="last_log_in" class="gt_row gt_left" style="vertical-align: top;">12 months+</td>
<td headers="email" class="gt_row gt_left">Alice.Roach@dixie.edu, baxelgard@dixie.edu, Brigham.Duckett@utahtech.edu, d00327189@dmail.dixie.edu, d00331821@dmail.dixie.edu, d00352576@dmail.dixie.edu, d00440036@dmail.dixie.edu, d00480750@dmail.dixie.edu, David.Christensen@dixie.edu, Ellen.Paddock@dixie.edu, Emma.Lanners@dixie.edu, Emma.Lunceford@dixie.edu, Ethan.Schmalz@utahtech.edu, finaid@dixie.edu, GahunzireChris.Masozera@dixie.edu, Goble@dixie.edu, Griffiths@dixie.edu, Hauck@dixie.edu, Jay.Sorensen@dixie.edu, Jesse.Hicks@dixie.edu, Johnny.Caughman@dixie.edu, Kathryn.Sanders@dixie.edu, Lora.Klein@dixie.edu, na@data.dixie.edu, Nicole.Yazzie@dixie.edu, Pedersen@dixie.edu, rhunt@dixie.edu, Rose.Hill@dixie.edu, sgubler@dixie.edu, Shantelle.Owens@dixie.edu, Shay.Lamb@dixie.edu, Stacey.Koller@utahtech.edu, Stephen.Lee@dixie.edu, TJ.Griffiths2@utahtech.edu, Tosha.Onani@dixie.edu, Travis.Rosenberg@dixie.edu</td></tr>
    <tr><td headers="last_log_in" class="gt_row gt_left" style="vertical-align: top;">6 months+</td>
<td headers="email" class="gt_row gt_left">advisement@utahtech.edu, Audrey.Lama@utahtech.edu, Bruce.Harris@utahtech.edu, Chandler.Whitlock@utahtech.edu, Christian.Wright@utahtech.edu, Christina.Merrill@utahtech.edu, Cindi.Jenkins@utahtech.edu, d00440231@dmail.dixie.edu, d00483818@dmail.dixie.edu, David.Kaumans@utahtech.edu, Dustin.Johnson@utahtech.edu, Eli.Bermudez@utahtech.edu, Jameson.Hardy@utahtech.edu, Janet.Walker@utahtech.edu, JD.Robertson@utahtech.edu, jennifer.demke@utahtech.edu, Katelyn.Peterson@utahtech.edu, Kelly.Peterson-Fairchild@utahtech.edu, lee.yarrell@utahtech.edu, Leslie.Twitchell@utahtech.edu, Liz.Grover@utahtech.edu, Lory.Mattucci@utahtech.edu, Lucas.Jones@utahtech.edu, Merilee.Gustafson@utahtech.edu, Nathan.Beaumont@utahtech.edu, Robyn.Whipple@utahtech.edu, Ruth.Bruckert@utahtech.edu, Sarah.Vandermark@utahtech.edu, Terry.Harrison@utahtech.edu</td></tr>
    <tr><td headers="last_log_in" class="gt_row gt_left" style="vertical-align: top;">3 months+</td>
<td headers="email" class="gt_row gt_left">Alex.Chamberlain@utahtech.edu, Ali.Threet@utahtech.edu, biff.williams@utahtech.edu, Bryant.Flake@utahtech.edu, Chelsea.Richards@utahtech.edu, Courtney.White@utahtech.edu, Darlene.Dilley@utahtech.edu, Francine.Larger@utahtech.edu, Garyn.Gulbranson@utahtech.edu, Jared.Madsen@utahtech.edu, Jordon.Sharp@utahtech.edu, kara.sandberg@utahtech.edu, Kevin.Simmons@utahtech.edu, Michael.Lacourse@utahtech.edu, Nancy.Allred@utahtech.edu, Patrick.Smith@utahtech.edu, Sarah.Shurtliff@utahtech.edu, scott.crane@utahtech.edu, Scott.Jensen@utahtech.edu, Tasha.Toy@utahtech.edu</td></tr>
  </tbody>
  
  
</table>
</div>
```

:::
:::

::: {.cell}

:::


Out of the 174 registered users, there are:

* 7 Administrators (afl_gillesp, D00130751, D00003424, D00436636, D00432487, afl_rhyde, D00003279)
* 5 Publishers
* 162 Viewers

### Locked Users

There are also an additional 3 locked users. 
These users own 15 applications.

## System Dependencies

Posit Connect allows users to push dashboards and markdown documents. 
However, these applications contain R packages that have system level dependencies.
This check tries to determine which R packages would fail to install.


::: {.cell}

:::


### Summary

There are 74 R packages that can't be installed, due to 
989 missing system dependencies.


::: {.cell}
::: {.cell-output-display}

```{=html}
<div id="meizvxanxk" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#meizvxanxk .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#meizvxanxk .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#meizvxanxk .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#meizvxanxk .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#meizvxanxk .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#meizvxanxk .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#meizvxanxk .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#meizvxanxk .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#meizvxanxk .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#meizvxanxk .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#meizvxanxk .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#meizvxanxk .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#meizvxanxk .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}

#meizvxanxk .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#meizvxanxk .gt_from_md > :first-child {
  margin-top: 0;
}

#meizvxanxk .gt_from_md > :last-child {
  margin-bottom: 0;
}

#meizvxanxk .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#meizvxanxk .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#meizvxanxk .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#meizvxanxk .gt_row_group_first td {
  border-top-width: 2px;
}

#meizvxanxk .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#meizvxanxk .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#meizvxanxk .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#meizvxanxk .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#meizvxanxk .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#meizvxanxk .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#meizvxanxk .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#meizvxanxk .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#meizvxanxk .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#meizvxanxk .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-left: 4px;
  padding-right: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#meizvxanxk .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#meizvxanxk .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#meizvxanxk .gt_left {
  text-align: left;
}

#meizvxanxk .gt_center {
  text-align: center;
}

#meizvxanxk .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#meizvxanxk .gt_font_normal {
  font-weight: normal;
}

#meizvxanxk .gt_font_bold {
  font-weight: bold;
}

#meizvxanxk .gt_font_italic {
  font-style: italic;
}

#meizvxanxk .gt_super {
  font-size: 65%;
}

#meizvxanxk .gt_footnote_marks {
  font-style: italic;
  font-weight: normal;
  font-size: 75%;
  vertical-align: 0.4em;
}

#meizvxanxk .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#meizvxanxk .gt_indent_1 {
  text-indent: 5px;
}

#meizvxanxk .gt_indent_2 {
  text-indent: 10px;
}

#meizvxanxk .gt_indent_3 {
  text-indent: 15px;
}

#meizvxanxk .gt_indent_4 {
  text-indent: 20px;
}

#meizvxanxk .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="System Library">System Library</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="R Package">R Package</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">ImageMagick</td>
<td headers="pkg" class="gt_row gt_left">adimpro, animation, bamm, colorizer, idm, magick, magickGUI, moveVis, oceanmap, Thermimage, webshot</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">ImageMagick-c++</td>
<td headers="pkg" class="gt_row gt_left">adimpro, animation, bamm, colorizer, idm, magick, magickGUI, moveVis, oceanmap, Thermimage, webshot</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">automake</td>
<td headers="pkg" class="gt_row gt_left">surveyvoi</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">cairo-devel</td>
<td headers="pkg" class="gt_row gt_left">Cairo, gdtools, httpgd, sen2r</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">cargo</td>
<td headers="pkg" class="gt_row gt_left">caviarpd, clarabel, fangs, gifski, hellorust, prqlr, rextendr, rshift, salso, string2path, ymd</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">cmake</td>
<td headers="pkg" class="gt_row gt_left">crc32c, highs, nanonext, neuronorm, nloptr, rbedrock, rkeops, rlibkriging, ROpenCVLite, rswipl, symengine, tiledb</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">cyrus-sasl-devel</td>
<td headers="pkg" class="gt_row gt_left">mongolite</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">dcraw</td>
<td headers="pkg" class="gt_row gt_left">adimpro</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">ffmpeg-devel</td>
<td headers="pkg" class="gt_row gt_left">av</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">fftw-devel</td>
<td headers="pkg" class="gt_row gt_left">bioacoustics, bioimagetools, cartogramR, ClusterR, diversitree, fftw, fftwtools, image.CannyEdges, imager, kza, LOMAR, MFPCA, nucim, OpenImageR, poisbinom, PoissonBinomial, PoissonMultinomial, qqconf, ravetools, Rssa, spate, specklestar, SuperGauss, surveyvoi, tsapp</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">file-libs</td>
<td headers="pkg" class="gt_row gt_left">bamm</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">fontconfig-devel</td>
<td headers="pkg" class="gt_row gt_left">devEMF, gdtools, httpgd, systemfonts</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">freetype-devel</td>
<td headers="pkg" class="gt_row gt_left">gdtools, httpgd, R2SWF, ragg, rgl, showtext, sysfonts, systemfonts, textshaping</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">fribidi-devel</td>
<td headers="pkg" class="gt_row gt_left">textshaping</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">gdal</td>
<td headers="pkg" class="gt_row gt_left">bamm, concaveman, CoordinateCleaner, deforestable, ebvcube, ech, extRatum, FedData, gdalcubes, gdalraster, geouy, ggseg, GWnnegPCA, GWpcor, happign, IceSat2R, mapme.biodiversity, mlr, MODIStsp, nlrx, PlanetNICFI, pRecipe, RCzechia, rgdal, sen2r, sf, smile, terra, tiler, vapour, VicmapR</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">gdal-devel</td>
<td headers="pkg" class="gt_row gt_left">bamm, concaveman, CoordinateCleaner, deforestable, ebvcube, ech, extRatum, FedData, gdalcubes, gdalraster, geouy, ggseg, GWnnegPCA, GWpcor, happign, IceSat2R, mapme.biodiversity, mlr, MODIStsp, nlrx, PlanetNICFI, pRecipe, RCzechia, rgdal, sen2r, sf, smile, terra, tiler, vapour, VicmapR</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">geos-devel</td>
<td headers="pkg" class="gt_row gt_left">apcf, bamm, concaveman, deforestable, ech, exactextractr, extRatum, gdalraster, geouy, ggseg, GWnnegPCA, GWpcor, happign, lwgeom, mlr, nlrx, RCzechia, rgeos, sen2r, sf, smile, spatsoc, terra, VicmapR</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">git</td>
<td headers="pkg" class="gt_row gt_left">credentials, dataMaid, dataReporter, fgitR, findInGit, gitcreds, gittargets, orderly, precommit, remotes, switchr, tiledb</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">glib2-devel</td>
<td headers="pkg" class="gt_row gt_left">RcppCWB, Rpoppler</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">glpk-devel</td>
<td headers="pkg" class="gt_row gt_left">anticlust, designmatch, glpkAPI, igraph, leidenAlg, rDEA, Rglpk, sdcTable</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">gmp-devel</td>
<td headers="pkg" class="gt_row gt_left">AlphaHull3D, arrangements, blindreview, Boov, cgalMeshes, cgalPolygons, delaunay, forsearch, gfilogisreg, gmp, igraph, interpolation, jack, kantorovich, lazyNumbers, LOMAR, MeshesTools, MinkowskiSum, mlr, multibridge, PMCMRplus, PolygonSoup, qspray, RationalMatrix, rcdd, RcppAlgos, RcppBigIntAlgos, Rmpfr, scModels, soilhypfit, surveyvoi, SymbolicDeterminants, symengine, TDA</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">gpgme</td>
<td headers="pkg" class="gt_row gt_left">gpg</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">gsl-devel</td>
<td headers="pkg" class="gt_row gt_left">abn, BayesVarSel, cit, coga, diversitree, dti, eaf, econetwork, excursions, flan, GeneralizedWendland, GPBayes, gsl, gslnls, hSDM, landsepi, LCMCR, Libra, mixture, mlr, monoreg, QF, RcppGSL, RDieHarder, ridge, Rlibeemd, rnetcarto, rtmpt, saotd, SimInf, simplexreg, smam, spaMM, SPARSEMODr, survSNP, topicmodels, VBLPCM, vol2birdR</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">harfbuzz-devel</td>
<td headers="pkg" class="gt_row gt_left">textshaping</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">haveged-devel</td>
<td headers="pkg" class="gt_row gt_left">gpg</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">hdf5-devel</td>
<td headers="pkg" class="gt_row gt_left">hdf5r, rblt, readNSx, vol2birdR</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">hiredis-devel</td>
<td headers="pkg" class="gt_row gt_left">RcppRedis, redux</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">java-1.8.0-openjdk-devel</td>
<td headers="pkg" class="gt_row gt_left">arulesCBA, arulesNBMiner, AWR, bartMachine, bartMachineJARs, BeastJar, bfw, BiBitR, CBSr, ChoR, collUtils, CommonJavaJars, corehunter, coreNLP, Crossover, cycleRtools, DatabaseConnector, Deducer, dialr, dialrjars, dismo, EvidenceSynthesis, fsdaR, ggdemetra, glmulti, gMCP, GreedyExperimentalDesign, GreedyExperimentalDesignJARs, h2o, helloJavaWorld, iMRMC, InSilicoVA, JavaGD, JGR, LeafArea, mailR, mallet, mutossGUI, mwa, mwcsr, nlrx, openNLP, openNLPdata, OpenStreetMap, pathfindR, qCBA, r.blip, r2pmml, r5r, rapidraker, rCBA, Rdroolsjars, restoptr, rflsgen, rGroovy, RH2, rJava, RJDemetra, rjdmarkdown, RJSDMX, rkafkajars, RKEA, RKEAjars, RKEEL, rmcfs, RMOA, RMOAjars, RNCBIEUtilsLibs, RNetLogo, rscala, rsparkling, rsubgroup, rtika, rviewgraph, RWeka, RWekajars, sdmApp, SDMtune, simplace, slowraker, spcosa, SqlRender, streamMOA, subspace, venneuler, wordnet, XLConnect, xlsx</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">libarchive</td>
<td headers="pkg" class="gt_row gt_left">archive, rswipl</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">libcurl-devel</td>
<td headers="pkg" class="gt_row gt_left">arrow, bioimagetools, cogmapr, curl, mRpostman, nucim, RCurl, strawr</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">libgit2-devel</td>
<td headers="pkg" class="gt_row gt_left">gert, git2r</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">libicu-devel</td>
<td headers="pkg" class="gt_row gt_left">stringi</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">libjpeg-turbo-devel</td>
<td headers="pkg" class="gt_row gt_left">ijtiff, jpeg, OpenImageR, qpdf, ragg, readbitmap, tiff</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">libpng-devel</td>
<td headers="pkg" class="gt_row gt_left">ggiraph, httpgd, image.CannyEdges, OpenImageR, png, R2SWF, ragg, readbitmap, rgl, rvg, showtext, svglite, sysfonts, vdiffr</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">librsvg2-devel</td>
<td headers="pkg" class="gt_row gt_left">rsvg</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">libsecret-devel</td>
<td headers="pkg" class="gt_row gt_left">keyring</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">libsndfile</td>
<td headers="pkg" class="gt_row gt_left">seewave</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">libsodium-devel</td>
<td headers="pkg" class="gt_row gt_left">sodium</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">libssh2</td>
<td headers="pkg" class="gt_row gt_left">git2r, plumberDeploy, ssh</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">libtiff-devel</td>
<td headers="pkg" class="gt_row gt_left">bioimagetools, ijtiff, imager, nucim, ragg, tiff</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">libwebp-devel</td>
<td headers="pkg" class="gt_row gt_left">webp</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">libxml2-devel</td>
<td headers="pkg" class="gt_row gt_left">igraph, leidenAlg, MIMSunit, nlrx, sen2r, XBRL, XML, XML, xml2</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">libxslt-devel</td>
<td headers="pkg" class="gt_row gt_left">xslt</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">make</td>
<td headers="pkg" class="gt_row gt_left">ABC.RAP, ADMMsigma, AovBay, aphid, asteRisk, autocart, baggr, bakR, baldur, batchmix, bayes4psy, bayesbr, bayesdfa, bayesforecast, bayesGAM, BayesianPlatformDesignTimeTrend, bayeslm, BayesSenMC, BayesXsrc, bayesZIB, BeeGUTS, bellreg, Bernadette, bfp, BGVAR, bigMap, BINtools, bioacoustics, bistablehistory, BivRec, blavaan, blockcluster, bmgarch, bmggum, bmlm, bmstdr, Boom, bootUR, breathteststan, BSPBSS, bws, CARME, CaseBasedReasoning, catSurv, CausalQueries, cbq, CNVRG, concatipede, conleyreg, conStruct, CPAT, cppRouting, ctsem, cubature, DA, DatabionicSwarm, datasailr, dbmss, DCPO, densEstBayes, detrendr, disaggregation, disbayes, DNAtools, dodgr, drf, dtwclust, dynBiplotGUI, dynr, eaf, EcoEnsemble, ECOSolveR, eggCounts, EloSteepness, EpiNow2, expertsurv, eyelinkReader, fasano.franceschini.test, fastTopics, fcirt, fdaPDE, FlexReg, FLSSS, fs, gastempt, gbp, GeneralizedUmatrix, geostan, gibasa, gKRLS, glmmfields, glmmPen, glmmrBase, glmmrOptim, glmmTMB, GMKMcharlie, gravmagsubs, greencrab.toolkit, grf, GWmodel, haven, hbamr, hBayesDM, hermiter, hgwrr, historicalborrowlong, hpa, hsstan, httpuv, hwep, IBRtools, IncDTW, IOHexperimenter, irace, isotracer, jackalope, JavaGD, jfa, lamW, latentnet, leidenAlg, lessSEM, lgpr, link2GI, LMMELSM, lpcde, MADPop, MapeBay, mappoly, mapview, markovchain, matrixprofiler, mbbefd, measr, metaBMA, MetaStan, mHMMbayes, microclass, milr, minqa, MIRES, MixAll, modeLLtest, mrbayes, MUACz, Multiaovbay, multibridge, multinma, N2R, navigation, NestedCategBayesImpute, networkscaleup, nimble, NNS, numbat, odbc, OncoBayes2, oncomsm, ondisc, openCR, OpenMx, Orcs, outerbase, patternplot, pcFactorStan, pdSpecEst, pema, PoolTestR, PReMiuM, PRIMME, prome, prophet, psrwe, publipha, qualpalr, quantdr, rapidjsonr, rater, rbedrock, RBesT, rbioacc, rbmi, rcbayes, RcppCWB, RcppMeCab, RcppParallel, RCurl, registr, rego, represtools, reservr, rJava, Rlgt, rlibkriging, rmBayes, rmdcev, Rmixmod, rmsb, rmumps, RoBTT, rofanova, roll, rolog, ropenblas, rPBK, rpf, rPref, Rserve, RSiena, rstan, rstanarm, rstanemax, rswipl, rticles, rtkore, rTRNG, rts2, rubias, SAR, sasfunclust, sass, Scalelink, scistreer, scs, sdmTMB, secr, sentometrics, seqminer, SimJoint, skm, slasso, smam, SparseChol, spsurv, ssMousetrack, StanHeaders, StanMoMo, StMoSim, stplanr, stringfish, surveil, survHE, survstan, symengine, TDA, textmineR, textrecipes, thurstonianIRT, tidysq, tipsae, tmbstan, trialr, TriDimRegression, truncnormbayes, tsmp, uavRmp, ubms, uchardet, unmarked, vol2birdR, walker, websocket, xgboost, YPBP, YPPE, zoid</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">mariadb-devel</td>
<td headers="pkg" class="gt_row gt_left">RMariaDB, RMySQL</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">mesa-libGL-devel</td>
<td headers="pkg" class="gt_row gt_left">rgl</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">mesa-libGLU-devel</td>
<td headers="pkg" class="gt_row gt_left">mlr, rgl</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">mpfr-devel</td>
<td headers="pkg" class="gt_row gt_left">AlphaHull3D, Boov, cgalMeshes, cgalPolygons, delaunay, lazyNumbers, MeshesTools, MinkowskiSum, mlr, multibridge, PMCMRplus, PolygonSoup, qspray, Rmpfr, saotd, scModels, soilhypfit, surveyvoi, symengine</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">netcdf-devel</td>
<td headers="pkg" class="gt_row gt_left">easyNCDF, gdalcubes, HiClimR, ncdf4, pRecipe, RNetCDF, sen2r, tidync</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">ocl-icd</td>
<td headers="pkg" class="gt_row gt_left">OpenCL</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">opencv-devel</td>
<td headers="pkg" class="gt_row gt_left">fastGLCM, forImage, image.textlinedetector, opencv</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">openmpi-devel</td>
<td headers="pkg" class="gt_row gt_left">bigGP, ergm, mlr, pbdMPI, pbdSLAP</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">openssl-devel</td>
<td headers="pkg" class="gt_row gt_left">arrow, bioimagetools, cogmapr, curl, DesignCTPB, GGally, git2r, MIMSunit, mongolite, mRpostman, nlrx, nucim, openssl, PKI, s2, sen2r, strawr, websocket</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">perl</td>
<td headers="pkg" class="gt_row gt_left">ctrdata, exifr, exiftoolr, gdata, geno2proteo, GetoptLong, Thermimage, ubiquity, varitas, WriteXLS, x.ent</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">perl-Image-ExifTool</td>
<td headers="pkg" class="gt_row gt_left">camtrapR, Thermimage, trackdem, xmpdf</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">pkgconf-pkg-config</td>
<td headers="pkg" class="gt_row gt_left">highs</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">poppler-cpp-devel</td>
<td headers="pkg" class="gt_row gt_left">pdftools, Rpoppler</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">postgresql-server-devel</td>
<td headers="pkg" class="gt_row gt_left">DIZutils, rpostgis, RPostgres</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">proj-devel</td>
<td headers="pkg" class="gt_row gt_left">bamm, concaveman, deforestable, ech, extRatum, gdalcubes, gdalraster, geouy, ggseg, GWnnegPCA, GWpcor, happign, lwgeom, mapme.biodiversity, mlr, MODIStsp, nlrx, pRecipe, proj4, RCzechia, reproj, rgdal, sen2r, sf, smile, terra, vapour, VicmapR, vol2birdR</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">protobuf-devel</td>
<td headers="pkg" class="gt_row gt_left">cld3, factset.protobuf.stach.v2, factset.protobuf.stachextensions, protolite, RProtoBuf, tfevents</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">python2</td>
<td headers="pkg" class="gt_row gt_left">altair, argparse, bdpar, botor, BrailleR, bspm, caracas, causact, cleanNLP, cloudml, CytOpT, dataframes2xls, digitalDLSorteR, DiNAMIC.Duo, elexr, fastGLCM, forImage, fuzzywuzzyR, GeoMongo, greta, greta.dynamics, greta.gp, guildai, h2o4gpu, ip2location, ip2proxy, IRkernel, MaOEA, meltt, MFSIS, motifr, nbconvertR, neptune, ngboostForecast, otsad, pdfminer, pharmr, ProcData, rasciidoc, rdataretriever, redist, reservoirnet, reticulate, rgeedim, RGF, rMIDAS, RPyGeo, rTorch, scaffolder, sendigR, slendr, SpatialDDLS, Statsomat, sudachir, symSEM, text, tiler, trackdem</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">python36</td>
<td headers="pkg" class="gt_row gt_left">CoNI, fastGLCM, nmslibR, otsad, pysd2r</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">redland</td>
<td headers="pkg" class="gt_row gt_left">redland</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">rust</td>
<td headers="pkg" class="gt_row gt_left">caviarpd, clarabel, fangs, gifski, hellorust, prqlr, rextendr, rshift, salso, string2path, ymd</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">sqlite-devel</td>
<td headers="pkg" class="gt_row gt_left">bamm, concaveman, CoordinateCleaner, deforestable, ebvcube, ech, extRatum, FedData, gdalcubes, gdalraster, geouy, ggseg, GWnnegPCA, GWpcor, happign, IceSat2R, lwgeom, mapme.biodiversity, mlr, MODIStsp, nlrx, PlanetNICFI, pmparser, pRecipe, RCzechia, rgdal, sen2r, sf, smile, terra, tiler, vapour, VicmapR</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">tcl</td>
<td headers="pkg" class="gt_row gt_left">biplotbootGUI, cncaGUI, DALY, juicr, metagear, multibiplotGUI, PhViD, rriskDistributions, switchboard, tcltk2, tkImgR, tkRplotR</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">tesseract-devel</td>
<td headers="pkg" class="gt_row gt_left">tesseract</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">texlive</td>
<td headers="pkg" class="gt_row gt_left">animation, bamm, bridger, huxtable, patientProfilesVis, SGP, Statsomat, texreg</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">tk</td>
<td headers="pkg" class="gt_row gt_left">biplotbootGUI, cncaGUI, DALY, juicr, metagear, multibiplotGUI, PhViD, rriskDistributions, switchboard, tcltk2, tkImgR, tkRplotR</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">tk-devel</td>
<td headers="pkg" class="gt_row gt_left">biplotbootGUI, cncaGUI, DALY, juicr, metagear, multibiplotGUI, PhViD, rriskDistributions, switchboard, tcltk2, tkImgR, tkRplotR</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">udunits2-devel</td>
<td headers="pkg" class="gt_row gt_left">nlrx, RNetCDF, tidync, units</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">unixODBC-devel</td>
<td headers="pkg" class="gt_row gt_left">odbc, RODBC, RODBC</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">zeromq-devel</td>
<td headers="pkg" class="gt_row gt_left">clustermq, pbdZMQ, rzmq</td></tr>
    <tr><td headers="sys_libs" class="gt_row gt_left" style="vertical-align: top;">zlib-devel</td>
<td headers="pkg" class="gt_row gt_left">data.table, devEMF, git2r, haven, httpuv, ijtiff, ndjson, R2SWF, rbedrock, rgl, rmatio, seqinr, seqminer, showtext, sysfonts, TAQMNGR</td></tr>
  </tbody>
  
  
</table>
</div>
```

:::
:::


## Software Versions

Posit Connect contains multiple versions of R, Python and Quarto.
This audit compares the installed version, to the latest version. 
We've highlighted any older versions.


::: {.cell}
::: {.cell-output-display}

```{=html}
<div id="qsaoxgnzzo" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#qsaoxgnzzo .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#qsaoxgnzzo .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#qsaoxgnzzo .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#qsaoxgnzzo .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#qsaoxgnzzo .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#qsaoxgnzzo .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#qsaoxgnzzo .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#qsaoxgnzzo .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#qsaoxgnzzo .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#qsaoxgnzzo .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#qsaoxgnzzo .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#qsaoxgnzzo .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#qsaoxgnzzo .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}

#qsaoxgnzzo .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#qsaoxgnzzo .gt_from_md > :first-child {
  margin-top: 0;
}

#qsaoxgnzzo .gt_from_md > :last-child {
  margin-bottom: 0;
}

#qsaoxgnzzo .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#qsaoxgnzzo .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#qsaoxgnzzo .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#qsaoxgnzzo .gt_row_group_first td {
  border-top-width: 2px;
}

#qsaoxgnzzo .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#qsaoxgnzzo .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#qsaoxgnzzo .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#qsaoxgnzzo .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#qsaoxgnzzo .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#qsaoxgnzzo .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#qsaoxgnzzo .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#qsaoxgnzzo .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#qsaoxgnzzo .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#qsaoxgnzzo .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-left: 4px;
  padding-right: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#qsaoxgnzzo .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#qsaoxgnzzo .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#qsaoxgnzzo .gt_left {
  text-align: left;
}

#qsaoxgnzzo .gt_center {
  text-align: center;
}

#qsaoxgnzzo .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#qsaoxgnzzo .gt_font_normal {
  font-weight: normal;
}

#qsaoxgnzzo .gt_font_bold {
  font-weight: bold;
}

#qsaoxgnzzo .gt_font_italic {
  font-style: italic;
}

#qsaoxgnzzo .gt_super {
  font-size: 65%;
}

#qsaoxgnzzo .gt_footnote_marks {
  font-style: italic;
  font-weight: normal;
  font-size: 75%;
  vertical-align: 0.4em;
}

#qsaoxgnzzo .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#qsaoxgnzzo .gt_indent_1 {
  text-indent: 5px;
}

#qsaoxgnzzo .gt_indent_2 {
  text-indent: 10px;
}

#qsaoxgnzzo .gt_indent_3 {
  text-indent: 15px;
}

#qsaoxgnzzo .gt_indent_4 {
  text-indent: 20px;
}

#qsaoxgnzzo .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Latest version">Latest version</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Installed version">Installed version</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <th colspan="2" class="gt_group_heading" scope="colgroup" id="Quarto">Quarto</th>
    </tr>
    <tr class="gt_row_group_first"><td headers="Quarto  version" class="gt_row gt_right" style="background-color: rgba(245,157,154,0.8); color: #FFFFFF; font-weight: bold;">1.0.38</td>
<td headers="Quarto  installed_version" class="gt_row gt_right" style="background-color: rgba(245,157,154,0.8); color: #FFFFFF; font-weight: bold;">Not installed</td></tr>
    <tr><td headers="Quarto  version" class="gt_row gt_right" style="background-color: rgba(245,157,154,0.8); color: #FFFFFF; font-weight: bold;">1.1.251</td>
<td headers="Quarto  installed_version" class="gt_row gt_right" style="background-color: rgba(245,157,154,0.8); color: #FFFFFF; font-weight: bold;">Not installed</td></tr>
    <tr><td headers="Quarto  version" class="gt_row gt_right" style="background-color: rgba(245,157,154,0.8); color: #FFFFFF; font-weight: bold;">1.2.475</td>
<td headers="Quarto  installed_version" class="gt_row gt_right" style="background-color: rgba(245,157,154,0.8); color: #FFFFFF; font-weight: bold;">Not installed</td></tr>
    <tr><td headers="Quarto  version" class="gt_row gt_right" style="background-color: rgba(245,157,154,0.8); color: #FFFFFF; font-weight: bold;">1.3.361</td>
<td headers="Quarto  installed_version" class="gt_row gt_right" style="background-color: rgba(245,157,154,0.8); color: #FFFFFF; font-weight: bold;">Not installed</td></tr>
    <tr class="gt_group_heading_row">
      <th colspan="2" class="gt_group_heading" scope="colgroup" id="Python">Python</th>
    </tr>
    <tr class="gt_row_group_first"><td headers="Python  version" class="gt_row gt_right" style="background-color: rgba(245,157,154,0.8); color: #FFFFFF; font-weight: bold;">3.7.16</td>
<td headers="Python  installed_version" class="gt_row gt_right" style="background-color: rgba(245,157,154,0.8); color: #FFFFFF; font-weight: bold;">Not installed</td></tr>
    <tr><td headers="Python  version" class="gt_row gt_right" style="background-color: rgba(245,157,154,0.8); color: #FFFFFF; font-weight: bold;">3.8.16</td>
<td headers="Python  installed_version" class="gt_row gt_right" style="background-color: rgba(245,157,154,0.8); color: #FFFFFF; font-weight: bold;">Not installed</td></tr>
    <tr><td headers="Python  version" class="gt_row gt_right" style="background-color: rgba(245,157,154,0.8); color: #FFFFFF; font-weight: bold;">3.9.16</td>
<td headers="Python  installed_version" class="gt_row gt_right" style="background-color: rgba(245,157,154,0.8); color: #FFFFFF; font-weight: bold;">Not installed</td></tr>
    <tr><td headers="Python  version" class="gt_row gt_right" style="background-color: rgba(245,157,154,0.8); color: #FFFFFF; font-weight: bold;">3.10.11</td>
<td headers="Python  installed_version" class="gt_row gt_right" style="background-color: rgba(245,157,154,0.8); color: #FFFFFF; font-weight: bold;">Not installed</td></tr>
    <tr><td headers="Python  version" class="gt_row gt_right" style="background-color: rgba(245,157,154,0.8); color: #FFFFFF; font-weight: bold;">3.11.3</td>
<td headers="Python  installed_version" class="gt_row gt_right" style="background-color: rgba(245,157,154,0.8); color: #FFFFFF; font-weight: bold;">Not installed</td></tr>
    <tr class="gt_group_heading_row">
      <th colspan="2" class="gt_group_heading" scope="colgroup" id="R">R</th>
    </tr>
    <tr class="gt_row_group_first"><td headers="R  version" class="gt_row gt_right" style="background-color: rgba(245,157,154,0.8); color: #FFFFFF; font-weight: bold;">3.6.3</td>
<td headers="R  installed_version" class="gt_row gt_right" style="background-color: rgba(245,157,154,0.8); color: #FFFFFF; font-weight: bold;">3.6.2</td></tr>
    <tr><td headers="R  version" class="gt_row gt_right" style="background-color: rgba(245,157,154,0.8); color: #FFFFFF; font-weight: bold;">4.0.5</td>
<td headers="R  installed_version" class="gt_row gt_right" style="background-color: rgba(245,157,154,0.8); color: #FFFFFF; font-weight: bold;">Not installed</td></tr>
    <tr><td headers="R  version" class="gt_row gt_right" style="background-color: rgba(245,157,154,0.8); color: #FFFFFF; font-weight: bold;">4.1.3</td>
<td headers="R  installed_version" class="gt_row gt_right" style="background-color: rgba(245,157,154,0.8); color: #FFFFFF; font-weight: bold;">Not installed</td></tr>
    <tr><td headers="R  version" class="gt_row gt_right" style="background-color: rgba(245,157,154,0.8); color: #FFFFFF; font-weight: bold;">4.2.3</td>
<td headers="R  installed_version" class="gt_row gt_right" style="background-color: rgba(245,157,154,0.8); color: #FFFFFF; font-weight: bold;">4.2.1</td></tr>
    <tr><td headers="R  version" class="gt_row gt_right" style="background-color: rgba(245,157,154,0.8); color: #FFFFFF; font-weight: bold;">4.3.0</td>
<td headers="R  installed_version" class="gt_row gt_right" style="background-color: rgba(245,157,154,0.8); color: #FFFFFF; font-weight: bold;">Not installed</td></tr>
  </tbody>
  
  
</table>
</div>
```

:::
:::


## Deployments

This audit deploys a variety of applications, ranging from Shiny apps to quarto documents.
The test determines if the application has been successful launched.


::: {.cell}
::: {.cell-output-display}

```{=html}
<div id="ywqppiiwuq" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#ywqppiiwuq .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#ywqppiiwuq .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#ywqppiiwuq .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#ywqppiiwuq .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#ywqppiiwuq .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#ywqppiiwuq .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#ywqppiiwuq .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#ywqppiiwuq .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#ywqppiiwuq .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#ywqppiiwuq .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#ywqppiiwuq .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#ywqppiiwuq .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#ywqppiiwuq .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}

#ywqppiiwuq .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#ywqppiiwuq .gt_from_md > :first-child {
  margin-top: 0;
}

#ywqppiiwuq .gt_from_md > :last-child {
  margin-bottom: 0;
}

#ywqppiiwuq .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#ywqppiiwuq .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#ywqppiiwuq .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#ywqppiiwuq .gt_row_group_first td {
  border-top-width: 2px;
}

#ywqppiiwuq .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#ywqppiiwuq .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#ywqppiiwuq .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#ywqppiiwuq .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#ywqppiiwuq .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#ywqppiiwuq .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#ywqppiiwuq .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#ywqppiiwuq .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#ywqppiiwuq .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#ywqppiiwuq .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-left: 4px;
  padding-right: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#ywqppiiwuq .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#ywqppiiwuq .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#ywqppiiwuq .gt_left {
  text-align: left;
}

#ywqppiiwuq .gt_center {
  text-align: center;
}

#ywqppiiwuq .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#ywqppiiwuq .gt_font_normal {
  font-weight: normal;
}

#ywqppiiwuq .gt_font_bold {
  font-weight: bold;
}

#ywqppiiwuq .gt_font_italic {
  font-style: italic;
}

#ywqppiiwuq .gt_super {
  font-size: 65%;
}

#ywqppiiwuq .gt_footnote_marks {
  font-style: italic;
  font-weight: normal;
  font-size: 75%;
  vertical-align: 0.4em;
}

#ywqppiiwuq .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#ywqppiiwuq .gt_indent_1 {
  text-indent: 5px;
}

#ywqppiiwuq .gt_indent_2 {
  text-indent: 10px;
}

#ywqppiiwuq .gt_indent_3 {
  text-indent: 15px;
}

#ywqppiiwuq .gt_indent_4 {
  text-indent: 20px;
}

#ywqppiiwuq .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Deployment">Deployment</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Time (secs)">Time (secs)</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <th colspan="2" class="gt_group_heading" scope="colgroup" id="Looks good">Looks good</th>
    </tr>
    <tr class="gt_row_group_first"><td headers="Looks good  context" class="gt_row gt_left"><div style='line-height:14px'><span style='font-weight:normal;font-variant:normal;color:#1A1A1A;font-size:14px'>Old Faithful</div>
<div style='line-height:10px'><span style ='font-weight:normal;color:#7F7F7F;font-size:10px'>deploy_git: public-github</span></div></td>
<td headers="Looks good  time_taken" class="gt_row gt_right">4.64</td></tr>
    <tr><td headers="Looks good  context" class="gt_row gt_left"><div style='line-height:14px'><span style='font-weight:normal;font-variant:normal;color:#1A1A1A;font-size:14px'>Read, write &amp; delete pins</div>
<div style='line-height:10px'><span style ='font-weight:normal;color:#7F7F7F;font-size:10px'>deploy_pins: rds</span></div></td>
<td headers="Looks good  time_taken" class="gt_row gt_right">4.27</td></tr>
    <tr><td headers="Looks good  context" class="gt_row gt_left"><div style='line-height:14px'><span style='font-weight:normal;font-variant:normal;color:#1A1A1A;font-size:14px'>Plumber API deployment</div>
<div style='line-height:10px'><span style ='font-weight:normal;color:#7F7F7F;font-size:10px'>deploy_plumber: api</span></div></td>
<td headers="Looks good  time_taken" class="gt_row gt_right">6.25</td></tr>
    <tr class="gt_group_heading_row">
      <th colspan="2" class="gt_group_heading" scope="colgroup" id="Failed">Failed</th>
    </tr>
    <tr class="gt_row_group_first"><td headers="Failed  context" class="gt_row gt_left"><div style='line-height:14px'><span style='font-weight:normal;font-variant:normal;color:#1A1A1A;font-size:14px'>Deploy flask app</div>
<div style='line-height:10px'><span style ='font-weight:normal;color:#7F7F7F;font-size:10px'>deploy_python: flask</span></div></td>
<td headers="Failed  time_taken" class="gt_row gt_right">4.27</td></tr>
    <tr><td headers="Failed  context" class="gt_row gt_left"><div style='line-height:14px'><span style='font-weight:normal;font-variant:normal;color:#1A1A1A;font-size:14px'>Deploy streamlit app</div>
<div style='line-height:10px'><span style ='font-weight:normal;color:#7F7F7F;font-size:10px'>deploy_python: streamlit</span></div></td>
<td headers="Failed  time_taken" class="gt_row gt_right">4.37</td></tr>
    <tr><td headers="Failed  context" class="gt_row gt_left"><div style='line-height:14px'><span style='font-weight:normal;font-variant:normal;color:#1A1A1A;font-size:14px'>Deploy basic app</div>
<div style='line-height:10px'><span style ='font-weight:normal;color:#7F7F7F;font-size:10px'>deploy_shiny: basic_app</span></div></td>
<td headers="Failed  time_taken" class="gt_row gt_right">0.51</td></tr>
    <tr><td headers="Failed  context" class="gt_row gt_left"><div style='line-height:14px'><span style='font-weight:normal;font-variant:normal;color:#1A1A1A;font-size:14px'>Deploying beamer</div>
<div style='line-height:10px'><span style ='font-weight:normal;color:#7F7F7F;font-size:10px'>render_quarto: beamer</span></div></td>
<td headers="Failed  time_taken" class="gt_row gt_right">3.92</td></tr>
    <tr><td headers="Failed  context" class="gt_row gt_left"><div style='line-height:14px'><span style='font-weight:normal;font-variant:normal;color:#1A1A1A;font-size:14px'>Deploying docx</div>
<div style='line-height:10px'><span style ='font-weight:normal;color:#7F7F7F;font-size:10px'>render_quarto: docx</span></div></td>
<td headers="Failed  time_taken" class="gt_row gt_right">7.25</td></tr>
    <tr><td headers="Failed  context" class="gt_row gt_left"><div style='line-height:14px'><span style='font-weight:normal;font-variant:normal;color:#1A1A1A;font-size:14px'>Deploying html</div>
<div style='line-height:10px'><span style ='font-weight:normal;color:#7F7F7F;font-size:10px'>render_quarto: html</span></div></td>
<td headers="Failed  time_taken" class="gt_row gt_right">4.42</td></tr>
    <tr><td headers="Failed  context" class="gt_row gt_left"><div style='line-height:14px'><span style='font-weight:normal;font-variant:normal;color:#1A1A1A;font-size:14px'>Deploying observable</div>
<div style='line-height:10px'><span style ='font-weight:normal;color:#7F7F7F;font-size:10px'>render_quarto: observable</span></div></td>
<td headers="Failed  time_taken" class="gt_row gt_right">3.89</td></tr>
    <tr><td headers="Failed  context" class="gt_row gt_left"><div style='line-height:14px'><span style='font-weight:normal;font-variant:normal;color:#1A1A1A;font-size:14px'>Deploying pdf</div>
<div style='line-height:10px'><span style ='font-weight:normal;color:#7F7F7F;font-size:10px'>render_quarto: pdf</span></div></td>
<td headers="Failed  time_taken" class="gt_row gt_right">4.32</td></tr>
    <tr><td headers="Failed  context" class="gt_row gt_left"><div style='line-height:14px'><span style='font-weight:normal;font-variant:normal;color:#1A1A1A;font-size:14px'>Jupyter engine</div>
<div style='line-height:10px'><span style ='font-weight:normal;color:#7F7F7F;font-size:10px'>render_quarto: python</span></div></td>
<td headers="Failed  time_taken" class="gt_row gt_right">10.22</td></tr>
    <tr><td headers="Failed  context" class="gt_row gt_left"><div style='line-height:14px'><span style='font-weight:normal;font-variant:normal;color:#1A1A1A;font-size:14px'>Deploying rsvg_convert</div>
<div style='line-height:10px'><span style ='font-weight:normal;color:#7F7F7F;font-size:10px'>render_quarto: rsvg_convert</span></div></td>
<td headers="Failed  time_taken" class="gt_row gt_right">3.54</td></tr>
    <tr><td headers="Failed  context" class="gt_row gt_left"><div style='line-height:14px'><span style='font-weight:normal;font-variant:normal;color:#1A1A1A;font-size:14px'>Deploying html</div>
<div style='line-height:10px'><span style ='font-weight:normal;color:#7F7F7F;font-size:10px'>render_rmd: html</span></div></td>
<td headers="Failed  time_taken" class="gt_row gt_right">64.8</td></tr>
    <tr><td headers="Failed  context" class="gt_row gt_left"><div style='line-height:14px'><span style='font-weight:normal;font-variant:normal;color:#1A1A1A;font-size:14px'>Deploying pdf</div>
<div style='line-height:10px'><span style ='font-weight:normal;color:#7F7F7F;font-size:10px'>render_rmd: pdf</span></div></td>
<td headers="Failed  time_taken" class="gt_row gt_right">64.8</td></tr>
    <tr><td headers="Failed  context" class="gt_row gt_left"><div style='line-height:14px'><span style='font-weight:normal;font-variant:normal;color:#1A1A1A;font-size:14px'>Deploying word</div>
<div style='line-height:10px'><span style ='font-weight:normal;color:#7F7F7F;font-size:10px'>render_rmd: word</span></div></td>
<td headers="Failed  time_taken" class="gt_row gt_right">64.8</td></tr>
  </tbody>
  
  
</table>
</div>
```

:::
:::
