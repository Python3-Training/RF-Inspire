| *** Settings ***
| Documentation	| Standard & Error Output


| *** Test Cases ***
| Written Test	| [Documentation]     | Write
|		| LOG TO CONSOLE      | \n\nThis is a console comment...\n\n |
|		| lOg TO cOnSOLe      | \n\nThis is a console ERROR...\n\n | STDERR |
