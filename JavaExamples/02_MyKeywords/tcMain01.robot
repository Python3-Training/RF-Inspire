# Be sure that both `java` and `javac` can be run from your CLI.
| *** Settings ***
| Documentation	| How to re-use previous keywords & tests
| Resource      | ${CURDIR}/MyKeywords.resource |
| *** Test Cases ***
| Main Test	| [Documentation]     | Testing it all
|		| Log To Console      | \n
|		| Build Java          |
|		| Test Java           | MyMain
|		| Test App            | Java | MyMain
|		| Try App Param       |
|		| LOG TO CONSOLE      | Testing Success! |
