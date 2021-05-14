| *** Settings ***
| Documentation	| Passing a Test Case


| *** Test Cases ***
| First Test	| [Documentation]     | Manual Pass Exec - TC Only!
|		| LOG TO CONSOLE      | \n\nTest Case #1...\n\n |
|		| Pass Execution      | All too easy ...
|		| Fail                | 

| Next Test	| [Documentation]     | Testing Success
|		| LOG TO CONSOLE      | \n\nTest Case #2...\n\n |
