| *** Settings ***
| Documentation	| Builtin & String Primer 004
| Library	| String


| *** Variables ***
| ${input}   | MoOd


| *** Test Cases ***
| Keyword Test	| [Documentation]   | Keyword Examples.
|		| Test Case A	| ${input}
|		| Test Case 2	| ${input}


| *** Keywords ***
| Test Case A	|
| 		| [Arguments] 	 | ${stuff} |
|		| ${zmood}          | Convert To Lower Case | ${stuff} 
|		| Should Be Equal   | ${zmood}              | mood


| Test Case 2	|
| 		| [Arguments] 	 | ${stuff} |
|		| ${zmood}          | Convert To Upper Case | ${stuff} 
|		| Should Be Equal   | ${zmood}              | MOOD
