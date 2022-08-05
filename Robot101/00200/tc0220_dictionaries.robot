| *** Settings ***
| Documentation	| Basic Dictionary 'Ops
| Library	| Collections


| *** Variables ***
| &{input} 	| key_a=B 	    | key_c='123'


| *** Test Cases ***
| Inspect Dict  | [Documentation]   | Basic Operations
|		| Log To Console    | ${input}
|		| Dictionary Should Contain Key     | ${input} | key_a | B
|		| Dictionary Should Contain Item    | ${input} | key_a | B
| Enum KV List	| [Documentation]   | Each key=value Pairing
|		| Log To Console    | \n
|		| FOR | ${value} | IN | &{input}
|		|     | Log To Console | KV Pair: ${value}
|		| END | 
| Enum Keys	| [Documentation]   | Examine KEY (no item!)
|		| Log To Console    | \n
|		| FOR | ${value} | IN | @{input}
|		|     | Log To Console | GOT: ${value}
|		| END | 
| Enum Values	| [Documentation]   | Examine KEYED ITEM
|		| Log To Console    | \n
|		| FOR | ${value} | IN | &{input}
|		|     | ${lval} | Get From List | ${value} | 0
|		|     | ${rval} | Get From List | ${value} | 1
|		|     | Log To Console | ${lval} ${rval}
|		| END | 
| Enum Yikes	| [Documentation]   | All-in One - Enum!
|		| Log To Console    | \n
|		| FOR | ${value} | IN | ${input}
|		|     | Log To Console | Yikes: ${value}
|		| END | 
