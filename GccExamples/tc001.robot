# Be sure that `gcc` is installed & can be run from your CLI.
| *** Settings ***
| Documentation	| Basics: Building and testing a GCC Program
| Library       | Process
| Library	| BuiltIn
| Library       | Platform
| *** Variables ***
| ${RUN_TYPE}   | 'BUILD' # What to run - either `BUILD` or `TEST.`
| ${PLATFORM}   | platform.system()
| *** Keywords ***
| Build GCC	| [Documentation]     | Compile our GCC - file name parameter
|               | [Arguments] 	      | ${PARAMS}
|		| LOG TO CONSOLE      | Building GCC... |
|		| ${EXIT_CODE}	      | Run Process	| gcc | ${PARAMS}
|		| Should Be Equal As Integers | ${EXIT_CODE.rc}  | 0 
|		| Set Global Variable | ${RUN_TYPE} | 'TEST' |
| Test GCC	| [Documentation]     | Test our GCC - file name parameter
|               | [Arguments] 	      | ${EXE} | ${RESULT}
|		| LOG TO CONSOLE      | Testing GCC in: ${EXE} out: ${RESULT} ...
|		| ${EXIT_CODE}	      | Run Process	| ${EXE}
|		| Should Be Equal     | ${EXIT_CODE.rc} | ${0} 
|		| Should Be Equal     | ${EXIT_CODE.stdout} | ${RESULT} 
|		| Set Global Variable | ${RUN_TYPE} | 'DONE' |
| *** Test Cases ***
| First Test	| [Documentation]     | Tracking build state.
|		| LOG TO CONSOLE      | \n\nTest Case #1...\n |
|		| Run Keyword If      | ${RUN_TYPE} == 'BUILD'  | Build GCC | echo01.c 
|		| Run Keyword If      | ${RUN_TYPE} != 'TEST'   | Fail
|		| IF      	      | ${PLATFORM} == 'Windows' |
|	        |  		      | Test GCC | .\\a.exe | Got .\\a.exe
|		| ELSE		      |
|	        |  		      | ${EXIT_CODE}    | Run Process | chmod | +777 | ./a.out
|		|                     | Should Be Equal | ${EXIT_CODE.rc} | ${0} 
|	        |  		      | Test GCC | ./a.out | Got ./a.out
|		| END		      |
|		| Run Keyword If      | ${RUN_TYPE} != 'DONE'   | Fail
|		| LOG TO CONSOLE      | Testing Success! |