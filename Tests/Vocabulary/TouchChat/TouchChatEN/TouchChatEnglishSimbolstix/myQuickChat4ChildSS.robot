*** Settings ***
Documentation       Check "myQuickChat 4 Child SS" ENGLISH vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor

*** Test Cases ***
Validate "myQuickChat 4 Child SS" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select language            ${english}
    Select Symbol Set: SymbolStix without aditional vocabularies
    Create user                EnglishUser
    Maximize the window
    Reach Library of vocabs    l
    Select vocabulary    name:English    name:SymbolStix    ${myQuickChat4ChildSS}

Assertions
    # Click on a button's text - myQuickChat 4 Child SS
    Set Resolution    ${window}    1800    800
    Get Element    name:Help    timeout=5
    ${text}    Set Variable    Quickchat 1
    Click On Button With Text    ${text}    TouchChat\\TouchChatEnglish\\myQuickChat4ChildSS\\quickchat.png    0.6

    Check to see if the user exist

    # Check to see if the dictionary's name is included in the text box - myQuickChat 4 Child SS
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    The vocabulary "myQuickChat 4 Child SS"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - myQuickChat 4 Child SS
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:SymbolStix
    ${name}=    RPA.Windows.Get Attribute    name:"myQuickChat 4 Child SS (Current)"    Name
    Should Be Equal    ${name}    myQuickChat 4 Child SS (Current)
