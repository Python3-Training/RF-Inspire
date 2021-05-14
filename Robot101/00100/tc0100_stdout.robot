| *** Settings ***
| Documentation	| Basic Output: Standard-Output


| *** Test Cases ***
| Written Test	| [Documentation]     | Write
|		| Comment             | This is a test comment... |
|		| Log                 | This is a logger comment... | WARN |
|		| log To console      | \n\nThis is a console comment...\n\n |
