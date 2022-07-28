# Be sure that both `java` and `javac` can be run from your CLI.
| *** Settings ***
| Documentation	| Building and testing Java Programs
| Library       | Process
| *** Keywords ***
| Build Java	| [Documentation]     | Compile Java files
|               | [Arguments] 	      | @{PARAMS}
|		| LOG TO CONSOLE      | STEP: Compiling Java @{PARAMS} ...
|		| ${EXIT_CODE}	      | Run Process	 | javac | @{PARAMS}
|		| [return]	      | ${EXIT_CODE.rc}
| Test Java	| [Documentation]     | Test Java - file name & parameter
|               | [Arguments] 	      | @{PARAMS}
|		| LOG TO CONSOLE      | STEP: Testing Java @{PARAMS} ...
|		| ${EXIT_CODE}	      | Run Process	| java | @{PARAMS}
|		| [return]	      | ${EXIT_CODE.rc} 
| Get Output	| [Documentation]     | Get a 'hosted' app's responses
|               | [Arguments] 	      | ${AEXE} | ${APP_NAME} | @{PARAMS}
|		| LOG TO CONSOLE      | STEP: Testing ${AEXE} ${APP_NAME} @{PARAMS}
|		| Run Process	      | ${AEXE} | ${APP_NAME} | @{PARAMS} | alias=aproc
|		| ${exit_obj}	      | Get Process Result | aproc
|		| [return]	      | ${exit_obj.stdout}
