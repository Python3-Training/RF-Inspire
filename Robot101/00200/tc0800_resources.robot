| *** Settings ***
| Documentation	| Using Resource Robots 008
| Resource	| ./rc/password.robot


| *** Variables ***
| ${root}	| ./src


| *** Test Cases ***
| Keyword Test	| [Documentation]   | Resource Examples.
|		| Verify Login	    | kahuna | meh

