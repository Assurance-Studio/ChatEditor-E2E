*** Settings ***
Documentation       Check "WordPower25 Touch & Scan SS" ENGLISH vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor

*** Test Cases ***
Validate "WordPower25 Touch & Scan SS" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select language            ${english}
    Select Symbol Set: SymbolStix with WordPower aditional vocabulary
    Create user                EnglishUser
    Maximize the window
    Reach Library of vocabs    l
    Select vocabulary    name:English    name:SymbolStix    name:WordPower    ${wordPower25Touch&ScanSS}

Assertions
    # Click on a button's text - WordPower25 Touch & Scan SS
    Set Resolution    ${window}    1800    800
    Get Element    name:Help    timeout=5
    ${text}    Set Variable    I
    Click On Button With Text    ${text}    TouchChat\\TouchChatEnglish\\wordPower25Touch&ScanSS\\i.png    0.6
    ${message}=    RPA.Windows.Get Value    id:1000
    Should Contain    ${message}    I

    Check to see if the user exist

    # Check to see if the dictionary's name is included in the text box - WordPower25 Touch & Scan SS
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    The vocabulary "WordPower25 Touch & Scan SS"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - WordPower25 Touch & Scan SS
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:SymbolStix
    RPA.Windows.Click    name:WordPower
    ${name}=    RPA.Windows.Get Attribute    name:"WordPower25 Touch & Scan SS (Current)"    Name
    Should Be Equal    ${name}    WordPower25 Touch & Scan SS (Current)
