*** Settings ***
Documentation       Check "Show Hidden Buttons" feature
Resource            ../../../../Resources/resources.robot
Resource            ../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor

Library    Dialogs

*** Test Cases ***
Reach "4-Basic SS" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select language            ${english}
    Select Symbol Set: SymbolStix without aditional vocabularies
    Create user                EnglishUser
    Maximize the window
    Reach Library of vocabs    l
    Select vocabulary    name:English    name:SymbolStix    ${4BasicSS}

Reach "Hide Mode"
    Set Resolution    ${window}    1800    800
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    The vocabulary "4-Basic SS" is an Original and cannot be modified. A copy must be made in order to edit.
    RPA.Windows.Click    id:6
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    enter
    # RPA.Windows.Get Element    name:"ChatEditor • EDIT MODE:  4-Basic SS_Copy – 4-Main"
    # Click on "Hide Mode"
    RPA.Windows.Click    name:"Hide Mode"
    RPA.Windows.Get Element    name:"ChatEditor • HIDE MODE: Click each button to hide or show them"

Hide the "I want" button
    ${text}    Set Variable    I want
    Click On Button With Text    ${text}    TouchChat\\TouchChatEnglish\\4BasicSS\\iWant.png    0.6
    RPA.Windows.Click    ${edit_mode_btn}

Check that the button is hidden
    ${text}    Set Variable    ${None}
    Click On Button With Text    ${text}    TouchChat\\TouchChatEnglish\\4BasicSS\\hiddenButton.png    0.6
    ${message}=    RPA.Windows.Get Value    ${speechDisplayBar}
    Should Be Empty    ${message}

Activate "Show Hidden Buttons" feature
    RPA.Desktop.Press Keys    alt    s
    RPA.Windows.Click    Input
    RPA.Windows.Click    name:"Show Hidden Buttons"
    ${text}    Set Variable    I want
    Click On Button With Text    ${text}    TouchChat\\TouchChatEnglish\\4BasicSS\\iWant.png    0.6
    ${message}=    RPA.Windows.Get Value    ${speechDisplayBar}
    Should Contain    ${message}    I want
