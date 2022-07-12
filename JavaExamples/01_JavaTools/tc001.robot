# Be sure that both `java` and `javac` can be run from your CLI.
| *** Settings ***
| Documentation	| Basics: Building and testing a Java Program
| Library       | Process
| Library	| BuiltIn
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
| *** Test Cases ***
| First Test	| [Documentation]     | Tracking build state.
|		| LOG TO CONSOLE      | \n\nTest Case #1...\n |
|		| Run Keyword If      | ${RUN_TYPE} == 'BUILD'  | Build Java
|		| Run Keyword If      | ${RUN_TYPE} != 'TEST'   | Fail
|		| Test Java	      | MyMain
|		| Run Keyword If      | ${RUN_TYPE} != 'DONE'   | Fail
|		| LOG TO CONSOLE      | Testing Success! |
