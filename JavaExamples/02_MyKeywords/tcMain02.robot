# Be sure that both `java` and `javac` can be run from your CLI.
| *** Settings ***
| Documentation	| Re-usng previous concepts
| Resource      | ${CURDIR}/JavaKeywords.resource |
| *** Test Cases ***
| TEST CASE 02	| [Documentation]     | Java artifact creation & testing ][
|		| Log To Console      | \n
|		| ${acode}	      | Build Java | MyMain.java
|		| should be equal     | ${acode} | ${0}
|		| ${acode}	      | Test Java  | MyMain
|		| should be equal     | ${acode} | ${0}
|		| ${output}           | Get Output | java | MyMain | # No Params
|		| should be equal     | ${output} | Howdie!
|		| ${output}           | Get Output | java | MyMain | @{1, 'too'} | #Params
|		| should be equal     | ${output} | Howdie!\nGot: 1\nGot: too
