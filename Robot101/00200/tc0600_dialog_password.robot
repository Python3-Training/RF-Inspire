| *** Settings ***
| Documentation	| Using Dialog Input 006
| Library	| Dialogs
| Library	| String


| *** Variables ***
| ${user id}    | kahuna
| ${password}   | meh | # hardcode - yikes?


| *** Test Cases ***
| Keyword Test	| [Documentation]   | Password Examples.
|		| ${input}   | Get Value From User | ${user id} Password:
|		| Verify Login	| ${input}


| *** Keywords ***
| Verify Login	|
| 		| [Arguments] 	    | ${stuff} | 
|		| Should Be Equal   | ${stuff} | ${password}

