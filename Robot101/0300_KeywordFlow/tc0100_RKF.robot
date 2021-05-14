| *** Settings ***
| Documentation	| Conditionals & Updating Global Variables

| *** Variables ***
| ${RUN_TYPE}   | 'FALSE'

| *** Test Cases ***
| First Test	| [Documentation]     | Conditional Flow
|		| LOG TO CONSOLE      | \n\nTest Case #1...\n\n |
|		| Run Keyword If      | ${RUN_TYPE} == 'FALSE'  | Next Test
|		| Run Keyword If      | ${RUN_TYPE} == 'FALSE'  | Fail


| *** Keywords ***
| Next Test	| [Documentation]     | Testing Success
|		| LOG TO CONSOLE      | \n\nTest Case #2...\n\n |
|		| Set Global Variable | ${RUN_TYPE} | 'TRUE' |
