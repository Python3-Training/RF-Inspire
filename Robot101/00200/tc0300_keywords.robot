| *** Settings ***
| Documentation	| Builtin & String Primer 004
| Library	| String


| *** Variables ***
| ${input}   | MoOd


| *** Test Cases ***
| Keyword Test	| [Documentation]   | Keyword Examples.
|		| Test Case A	| 
|		| Test Case 2	|


| *** Keywords ***
| Test Case A	|
|		| ${zmood}          | Convert To Lower Case | ${input} 
|		| Should Be Equal   | ${zmood}              | mood


| Test Case 2	|
|		| ${zmood}          | Convert To Upper Case | ${input} 
|		| Should Be Equal   | ${zmood}              | MOOD
