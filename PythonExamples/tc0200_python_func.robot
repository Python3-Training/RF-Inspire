| *** Settings ***
| Documentation	| Testing Python Function (Library.py => Keyword[s]!)
| Library	| String
| Library	| Process
| Library	| Collections | # NEW!


| *** Variables ***
| ${user id}    | kahuna
| ${src}	| ./code
| ${python}	| python | # python3 ?

| *** Settings ***
| Library | ${src}/callafunc.py | # Spaces Replace Underscores

| *** Keywords ***
| Verify Login	| [Documentation]   | Explicit python intrepreter
| 		| [Arguments] 	    | ${stuff}
|		| ${response}	    | Run Process | ${python} | ${src}/password.py | ${user id} | ${stuff} 
|		| Should Be Equal   | ${response.stdout} | ${user id}


| *** Test Cases ***
| Keyword Test	| [Documentation]   | Password Example.
|		| Verify Login	    | meh
| Senda String	| [Documentation]   | Call arbitrary function [string].
|		| ${response}	    | show the type | meh |
|		| Should Be Equal   | ${response} | ${0}
| Senda Tup	| [Documentation]   | Call arbitrary function [tuple].
|		| ${response}	    | show the type | ${1, 2, 3} |
|		| Should Be Equal   | ${response} | ${0}
| Senda Yikes	| [Documentation]   | Call arbitrary function [not standard type].
|		| &{adict} 	    | Create Dictionary | key_a=B | key_c='123'
|		| ${response}	    | show the type | ${adict} |
|		| Should Be Equal   | ${response} | ${0}
