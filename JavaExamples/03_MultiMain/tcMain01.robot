# Be sure that both `java` and `javac` can be run from your CLI.
| *** Settings ***
| Documentation	| Additional Java Testing 'Ops
| Resource      | ${CURDIR}/JavaKeywords.resource
| Library       | Process
| Library	| OperatingSystem

| *** Keywords ***
| Build Java Folder        | [Documentation]  | Compile everything in a folder
|       | [Arguments] 	   | ${folder}
|       | Log To Console   | \n STEP: Building ${folder} ...
|       | @{files} 	   | List Files In Directory | ${folder} | *.java
|	| FOR | ${file}    | IN    | @{files}
|	|     | Log To Console     | START: Building ${file} ...
|	|     | ${rc} | Build Java | ${folder}/${file}
|       |     | Should be Equal    | ${rc} | ${0}
|       | END |

| *** Test Cases ***
| MAKE APath	| [Documentation]     | Java package creation
|		| Build Java Folder   | ${CURDIR}/APath/
| TEST APath	| [Documentation]     | Java package testing
|		| ${output}	      | Test Java | APath.ClassA
|		| Should Be Equal     | ${output} | ${0}
|		| ${output}	      | Test Java | APath.ClassB
|		| Should Be Equal     | ${output} | ${0}
