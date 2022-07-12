# Be sure that both `java` and `javac` can be run from your CLI.
| *** Settings ***
| Documentation	| Intermediate: Testing the standard output
| Library       | Process
| *** Keywords ***
| Test App	| [Documentation]     | Test our Java App's Responses
|               | [Arguments] 	      | ${AEXE} | ${APP_NAME}
|		| LOG TO CONSOLE      | Testing Default Processing ...
|		| Run Process	      | ${AEXE} | ${APP_NAME} | alias=aproc
|		| ${EXIT_OBJ}	      | Get Process Result | aproc
|		| Should Be Equal     | ${EXIT_OBJ.stdout} | Howdie!
| *** Test Cases ***
| Second Test	| [Documentation]     | Testing the default parameters (MyMain)
|		| LOG TO CONSOLE      | \n\nTest Case #2...\n |
|		| Test App	      | Java | MyMain
|		| LOG TO CONSOLE      | Testing Success! |
