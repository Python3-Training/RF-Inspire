| *** Settings ***
| Documentation	| Builtin & String Primer 001
| Library	| String


| *** Test Cases ***
| String Test	| [Documentation]   | String Examples.
|		| ${zmood}          | Convert To Lower Case | MoOD
|		| Should Be Equal   | ${zmood}              | mood
|		| ${zmood}          | Convert To Upper Case | MoOD
|		| Should Be Equal   | ${zmood}              | MOOD

