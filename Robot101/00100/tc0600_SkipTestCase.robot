| *** Settings ***
| Documentation	| Skip / ignore remaining Test Case


| *** Test Cases ***
| First Test	| [Documentation]     | Manual Skip Exec - TC Only!
|		| LOG TO CONSOLE      | \n\nTest Case #1...\n\n |
|		| Skip                | Good enough ...
|		| Fail                | 

| Next Test	| [Documentation]     | Testing Success
|		| LOG TO CONSOLE      | \n\nTest Case #2...\n\n |
