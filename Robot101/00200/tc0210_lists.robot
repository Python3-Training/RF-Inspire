| *** Settings ***
| Documentation	| Basic List 'Ops
| Library	| Collections


| *** Variables ***
| @{input} | a | B | 1 | ${2} | '3'


| *** Test Cases ***
| Inspect List	| [Documentation]   | Basic Operations
|		| Log To Console     | ${input}
|		| Should Contain     | ${input}	    | B 
|		| Should Contain     | ${input}	    | 1 
|		| Should Not Contain | ${input}	    | '1'
|		| Should Not Contain | ${input}	    | "1"
|		| Should Not Contain | ${input}	    | ${1} 
|		| Should Contain     | ${input}	    | ${2} 
|		| Should Contain     | ${input}	    | '3'
|		| Should Not Contain | ${input}	    | "3"
|		| Should Not Contain | ${input}	    | ${3}
| Enum List	| [Documentation]   | Examine Each Element
|		| Log To Console    | \n
|		| FOR | ${value} | IN | @{input}
|		|     | Log To Console | GOT: ${value}
|		| END | 
| No Enum List	| [Documentation]   | Never Each Element!
|		| FOR | ${value} | IN | ${input}
|		|     | Log To Console | \nYikes: ${value}
|		| END | 