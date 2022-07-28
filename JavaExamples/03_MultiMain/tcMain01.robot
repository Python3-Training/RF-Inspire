# Be sure that both `java` and `javac` can be run from your CLI.
| *** Settings ***
| Documentation	| Re-using previous keywords
| Resource      | ${CURDIR}/JavaKeywords.resource
| Library       | Process
| Library	| OperatingSystem

| *** Keywords ***
| Build Java Folder        | [Documentation]  | Compile everything in a folder |
|       | [Arguments] 	   | ${folder} | ${mask}
|       | Log To Console   | \n STEP: Building ${folder} ${mask} ...
|       | @{files} 	   | List Files In Directory | ${folder} | ${mask}
|	| FOR | ${file}    | IN    | @{files} |
|	|     | Log To Console     | START: Building ${file} ...
|	|     | ${rc} | Build Java | ${folder}/${file}
|       |     | Should be Equal    | ${rc} | ${0}
|       | END |

| *** Test Cases ***
| MAKE APath	| [Documentation]     | Java package creation & testing
|		| Build Java Folder   | ${CURDIR}/APath/ | *.java
