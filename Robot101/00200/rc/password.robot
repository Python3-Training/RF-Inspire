| *** Variables ***
| ${user id}    | kahuna
| ${password}   | meh

| *** Keywords ***
| Verify Login	|
| 		| [Arguments] 	    | ${zid}   | ${zpass}
|		| Should Be Equal   | ${zid}   | ${user id}
|		| Should Be Equal   | ${zpass} | ${password}
