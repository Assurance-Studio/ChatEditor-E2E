*** Settings ***
Documentation       Check "WordPower42 SS" ENGLISH vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor

*** Test Cases ***
Validate "WordPower42 SS" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select language            ${english}
    Select Symbol Set: SymbolStix with WordPower aditional vocabulary
    Create user                EnglishUser
    Maximize the window
    Reach Library of vocabs    l
    Select vocabulary    name:English    name:SymbolStix    name:WordPower    ${wordPower42SS}

Assertions
    # Click on a button's text - WordPower42 SS
    Set Resolution    ${window}    1800    800
    ${text}    Set Variable    PEOPLE
    Click On Button With Text    ${text}    TouchChat\\TouchChatEnglish\\wordPower42BasicSS\\people.png    0.6

    Check to see if the user exist

    # Check to see if the dictionary's name is included in the text box - WordPower42 SS
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    The vocabulary "WordPower42 SS"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - WordPower42 SS
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:SymbolStix
    RPA.Windows.Click    name:WordPower
    ${name}=    RPA.Windows.Get Attribute    name:"WordPower42 SS (Current)"    Name
    Should Be Equal    ${name}    WordPower42 SS (Current)
