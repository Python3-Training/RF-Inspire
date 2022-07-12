# Be sure that both `java` and `javac` can be run from your CLI.
| *** Settings ***
| Documentation	| Advanced: Verifying multi-line standard output
| Library       | Process
| *** Keywords ***
| Try App Param | [Documentation]     | Test 'deeper' app responses
|		| LOG TO CONSOLE      | Testing Parameter Processing ...
|		| Run Process	      | java | MyMain | Bingo! | alias=aproc
|		| ${EXIT_OBJ}	      | Get Process Result | aproc
|		| Should Be Equal     | ${EXIT_OBJ.stdout} | Howdie!\nGot: Bingo!
| *** Test Cases ***
| Third Test	| [Documentation]     | Testing MyMain Parameters
|		| LOG TO CONSOLE      | \n\nTest Case #3...\n |
|		| Try App Param       |
|		| LOG TO CONSOLE      | Testing Success! |
