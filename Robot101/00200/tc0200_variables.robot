| *** Settings ***
| Documentation	| Builtin & String Primer 002
| Library	| String


| *** Variables ***
| ${input}   | MoOd


| *** Test Cases ***
| String Test	| [Documentation]   | String Examples.
|		| ${zmood}          | Convert To Lower Case | ${input} 
|		| Should Be Equal   | ${zmood}              | mood
|		| ${zmood}          | Convert To Upper Case | ${input} 
|		| Should Be Equal   | ${zmood}              | MOOD
