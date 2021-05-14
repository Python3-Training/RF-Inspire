| *** Settings ***
| Documentation	| Using External Processes 007
| Library	| Dialogs
| Library	| String
| Library	| Process | # New!


| *** Variables ***
| ${user id}    | kahuna
| ${root}	| ./src


| *** Test Cases ***
| Keyword Test	| [Documentation]   | Password Examples.
|		| ${input}   | Get Value From User | ${user id} Password:
|		| Verify Login	| ${input}


| *** Keywords ***
| Verify Login	|
| 		| [Arguments] 	    | ${stuff} |
|		| ${response}	    | Run Process | ${root}/password.py | ${user id} | ${stuff} 
|		| Should Be Equal   | ${response.stdout} | ${user id}

