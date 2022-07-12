# Be sure that both `java` and `javac` can be run from your CLI.
| *** Settings ***
| Documentation	| Basics: Building and testing a Java Program
| Library       | Process
| *** Variables ***
| ${RUN_TYPE}   | 'BUILD' # What to run - either `BUILD` or `TEST.`
| *** Keywords ***
| Build Java	| [Documentation]     | Compile our Java - file name hard-coded
|		| LOG TO CONSOLE      | Building Java... |
|		| ${EXIT_CODE}	      | Run Process	 | javac | MyMain.java
|		| Should Be Equal As Integers | ${EXIT_CODE.rc}  | 0 
|		| Set Global Variable | ${RUN_TYPE} | 'TEST' |
| Test Java	| [Documentation]     | Test our Java - file name parameter
|               | [Arguments] 	      | ${PARAMS}
|		| LOG TO CONSOLE      | Testing Java ${PARAMS} ...
|		| ${EXIT_CODE}	      | Run Process	| java | ${PARAMS}
|		| Should Be Equal     | ${EXIT_CODE.rc} | ${0} 
|		| Set Global Variable | ${RUN_TYPE} | 'DONE' |
| Test App	| [Documentation]     | Test our Java App's Responses
|               | [Arguments] 	      | ${AEXE} | ${APP_NAME}
|		| LOG TO CONSOLE      | Testing Default Processing ...
|		| Run Process	      | ${AEXE} | ${APP_NAME} | alias=aproc
|		| ${EXIT_OBJ}	      | Get Process Result | aproc
|		| Should Be Equal     | ${EXIT_OBJ.stdout} | Howdie!
| Try App Param | [Documentation]     | Test 'deeper' app responses
|		| LOG TO CONSOLE      | Testing Parameter Processing ...
|		| Run Process	      | java | MyMain | Bingo! | alias=aproc
|		| ${EXIT_OBJ}	      | Get Process Result | aproc
|		| Should Be Equal     | ${EXIT_OBJ.stdout} | Howdie!\nGot: Bingo!
