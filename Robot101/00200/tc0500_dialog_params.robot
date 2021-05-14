| *** Settings ***
| Documentation	| Using Dialog Input 005
| Library	| Dialogs | # NEW!
| Library	| String


| *** Variables ***
| ${input}   | MoOd	| # Over-written in test case - ok!


| *** Test Cases ***
| Keyword Test	| [Documentation]   | Keyword Examples.
|		| ${input}   | Get Value From User | Mood?
|		| Test Case A	| ${input}
|		| Test Case 2	| ${input}


| *** Keywords ***
| Test Case A	|
| 		| [Arguments] 	    | ${stuff} |
|		| ${zmood}          | Convert To Lower Case | ${stuff} 
|		| Should Be Equal   | ${zmood}              | mood


| Test Case 2	|
| 		| [Arguments] 	    | ${stuff} |
|		| ${zmood}          | Convert To Upper Case | ${stuff} 
|		| Should Be Equal   | ${zmood}              | MOOD
