# Be sure that `jar`, `java` and `javac` can ALL be run from your CLI.
| *** Settings ***
| Documentation	| Creating & testing a Java Archive (JAR) File
| Resource      | ${CURDIR}/JavaKeywords.resource
| Library       | Process
| Library	| OperatingSystem

| *** Keywords ***
| Build Java Folder        | [Documentation]  | Compile everything in a folder
|       | [Arguments] 	   | ${folder}
|       | Log To Console   | \nSTART: Building ${folder} ...
|       | @{files} 	   | List Files In Directory | ${folder} | *.java
|	| FOR | ${file}    | IN    | @{files}
|	|     | Log To Console     | STEP: Building ${file} ...
|	|     | ${rc} | Build Java | ${folder}/${file}
|       |     | Should be Equal    | ${rc} | ${0}
|       | END |
| Build Java Archive       | [Documentation]  | Archive everything in a folder
|       | [Arguments] 	   | ${adir} 
|       | Log To Console   | \nSTART:Archiving ${adir} ...
|	| Run Process	   | jar | cf | ${adir}.jar | ${adir} | alias=aproc
|	| ${exit_obj}	   | Get Process Result     | aproc
|       | Should be Equal  | ${exit_obj.rc} | ${0}
|       | [return] | ${0} 
| Test Java Archive        | [Documentation]    | Test Java - JAR name & parameters
|       | [Arguments] 	   | ${jar} | @{PARAMS}
|	| LOG TO CONSOLE   | Testing Java @{PARAMS} ...
|	| ${EXIT_CODE}	   | Run Process | java | -classpath | ${jar} | @{PARAMS}
|	| [return]	   | ${EXIT_CODE.rc} 

| *** Test Cases ***
| MAKE AJAR	| [Documentation]     | Java Archive creation
|		| Build Java Folder   | ${CURDIR}/APath/
|		| Build Java Archive  | APath
| TEST AJAR	| [Documentation]     | Java Archive testing
|		| ${output}	      | Test Java Archive | apath.jar | APath.ClassA
|		| Should Be Equal     | ${output} | ${0}
|		| ${output}	      | Test Java Archive | apath.jar | APath.ClassB
|		| Should Be Equal     | ${output} | ${0}
