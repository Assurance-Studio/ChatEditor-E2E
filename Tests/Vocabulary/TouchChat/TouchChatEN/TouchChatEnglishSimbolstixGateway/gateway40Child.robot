*** Settings ***
Documentation       Check "Gateway 40 Child" ENGLISH vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor

*** Test Cases ***
Validate "Gateway 40 Child" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select language            ${english}
    Select Symbol Set: SymbolStix with Gateway aditional vocabulary
    Create user                EnglishUser
    Maximize the window
    Reach Library of vocabs    l
    Select vocabulary    name:English    name:SymbolStix    name:Gateway    ${gateway40Child}

Assertions
    # Check to see if there is a picture of the vocabulary icons - Gateway 40 Child
    Set Resolution    ${window}    1800    800
    ${text}    Set Variable    go
    Click On Button With Text    ${text}    TouchChat\\TouchChatEnglish\\gateway40Child\\go.png    0.6
    ${message}=    RPA.Windows.Get Value    id:1000
    Should Contain    ${message}    Go

    Check to see if the user exist

    # Check to see if the dictionary's name is included in the text box - Gateway 40 Child
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain     ${message}    The vocabulary "Gateway 40 Child"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - Gateway 40 Child
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:SymbolStix
    RPA.Windows.Click    name:Gateway
    ${name}=    RPA.Windows.Get Attribute        name:"Gateway 40 Child (Current)"    Name
    Should Be Equal    ${name}    Gateway 40 Child (Current)
