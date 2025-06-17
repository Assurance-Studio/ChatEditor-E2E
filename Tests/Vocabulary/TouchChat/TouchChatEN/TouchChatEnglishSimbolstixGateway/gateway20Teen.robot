*** Settings ***
Documentation       Check "Gateway 20 Teen" ENGLISH vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor

*** Test Cases ***
Validate "Gateway 20 Teen" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select language            ${english}
    Select Symbol Set: SymbolStix with Gateway aditional vocabulary
    Create user                EnglishUser
    Maximize the window
    Reach Library of vocabs    l
    Select vocabulary    name:English    name:SymbolStix    name:Gateway    ${gateway20Teen}

Assertions
    # Click on a button's text - Gateway 20 Teen
    Set Resolution    ${window}    1800    800
    Get Element    name:Help    timeout=5
    ${text}    Set Variable    I
    Click On Button With Text    ${text}    TouchChat\\TouchChatEnglish\\gateway20Teen\\i.png    0.6
    ${message}=    RPA.Windows.Get Value    id:1000
    Should Contain    ${message}    I

    Check to see if the user exist

    # Check to see if the dictionary's name is included in the text box - Gateway 20 Teen
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain     ${message}    The vocabulary "Gateway 20 Teen"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - Gateway 20 Teen
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:SymbolStix
    RPA.Windows.Click    name:Gateway
    ${name}=    RPA.Windows.Get Attribute        name:"Gateway 20 Teen (Current)"    Name
    Should Be Equal    ${name}    Gateway 20 Teen (Current)
