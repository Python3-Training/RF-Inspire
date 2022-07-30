# Be sure that `jar`, `java` and `javac` can ALL be run from your CLI.
| *** Settings ***
| Documentation	| Limitations - main() only! (Collection demos, too)
| Resource      | ${CURDIR}/JavaKeywords.resource
| Library       | Process
| Library	| OperatingSystem
| Library	| Collections

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
| Call Java Archive        | [Documentation]    | Call JAR -w- parameters
|       | [Arguments] 	   | ${jar} | @{PARAMS}
|	| LOG TO CONSOLE   | \nTesting Java @{PARAMS} ...
|	| Run Process      | java | -classpath      | ${jar} | @{PARAMS} | alias=aproc
|	| ${exit_obj}	   | Get Process Result     | aproc
|	| ${adict}	   | Create Dictionary | stdout | ${exit_obj.stdout} | rc | ${exit_obj.rc}
|	| [return]	   | &{adict} 

| *** Test Cases ***
| MAKE AJAR	| [Documentation]     | Java Archive creation
|		| Build Java Folder   | ${CURDIR}/APath/
|		| Build Java Archive  | APath
| CALL AJAR	| [Documentation]     | Java Archive - Default main() testing
|		| @{input}	      | Create List
|		| Append TO List      |  ${input} | APath.MyFunc | call me
|		| &{output}	      | Call Java Archive | apath.jar | @{input} |
|		| LOG TO CONSOLE      | \n\n${output}\n\n
|		| Should Be Equal     | ${output.rc} | ${123}
| FAIL AJAR	| [Documentation]     | Java static function testing - FAILS
|		| @{input}	      | Create List
|		| Append to List      |  ${input} | APath.MyFunc.justDoIt | call me
|		| &{output}	      | Call Java Archive | apath.jar | @{input} |
|		| LOG TO CONSOLE      | \n\n${output}\n\n
|		| Should Be Equal     | ${output.rc} | ${1}

