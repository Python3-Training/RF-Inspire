| *** Settings ***
| Documentation	| Testing the XML-RPC / Remote Service 001
| Library       | ./xRpcTester.py


| *** Variables ***
| ${IP_ADDRESS} | 10.0.2.15
| ${IP_PORT}    | 9000 


| *** Test Cases ***
| Test Remote Services
|			| Test Say Hello For | This Is aTest


| *** Keywords ***
| Test Say Hello For 	| [Documentation]   | Test the "Say Hello" service @ ${IP_ADDRESS}
| 			| [Arguments] 	    | ${PARAMA}
|			| ${Response}       | SayHello | ${PARAMA}
|			| Should Be Equal   | ${Response} | Hello ${PARAMA}!


