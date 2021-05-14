| *** Settings ***
| Documentation	| Stopping a Test Case


| *** Test Cases ***
| First Test	| [Documentation]     | Manual Fail - TC Only!
|		| LOG TO CONSOLE      | \n\nTest Case #1...\n\n |
#|		| Fatal Error         | 
|		| Fail                | 

| Next Test	| [Documentation]     | Testing Success
|		| LOG TO CONSOLE      | \n\nTest Case #2...\n\n |
