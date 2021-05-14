| *** Settings ***
| Documentation	| Comment + Stopping a Test 


| *** Test Cases ***
| Written Test	| [Documentation]     | Write
|		| LOG TO CONSOLE      | \n\nThis is a console comment...\n\n |
#		| Fatal Error         | 
|		| lOg TO cOnSOLe      | \n\nThis is a console ERROR...\n\n | STDERR |
