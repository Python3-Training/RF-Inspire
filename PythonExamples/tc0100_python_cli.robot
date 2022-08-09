| *** Settings ***
| Documentation	| Testing a Python CLI (EXPLICITLY)
| Library	| Dialogs
| Library	| String
| Library	| Process


| *** Variables ***
| ${user id}    | kahuna
| ${src}	| ./code
| ${python}	| python | # python3 ?


| *** Keywords ***
| Verify Login	| [Documentation]   | Explicit python intrepreter
| 		| [Arguments] 	    | ${stuff} |
|		| ${response}	    | Run Process | ${python} | ${src}/password.py | ${user id} | ${stuff} 
|		| Should Be Equal   | ${response.stdout} | ${user id}


| *** Test Cases ***
| Keyword Test	| [Documentation]   | Password Examples.
|		| ${input}   | Get Value From User | ${user id} Password:
|		| Verify Login	| ${input}
