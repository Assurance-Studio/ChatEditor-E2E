*** Settings ***
Documentation       Check "Speech Display Bar" feature
Resource            ../../../../Resources/resources.robot
Resource            ../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor

Library    Dialogs
Library    Process
Library    XML

*** Test Cases ***
Reach "Spelling SS" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select language            ${english}
    Select Symbol Set: SymbolStix without aditional vocabularies
    Create user                EnglishUser
    Maximize the window
    Reach Library of vocabs    l
    Select vocabulary    name:English    name:SymbolStix    NONE    ${spellingSS}

Reach "Speech Display Bar" modal
    RPA.Desktop.Press Keys    alt    s
    RPA.Windows.Click    Style
    RPA.Windows.Click    Speech Display Bar...
    ${text}=    RPA.Windows.Get Text    name:"Speech Display Bar"
    Should Be Equal    ${text}    Speech Display Bar

Adjust Fonts and Font Size
    RPA.Windows.Click    id:1014
    RPA.Windows.Click    name:Ubuntu
    RPA.Windows.Click    id:1010
    RPA.Windows.Click    name:"30 pts"
    ${fonts}=    RPA.Windows.Get Value    id:1014
    Should Be Equal  ${fonts}    Ubuntu
    ${font_size}=    RPA.Windows.Get Value    id:1010
    Should Be Equal  ${font_size}    30 pts

Adjust Text and Background Color
    RPA.Windows.Click    id:1007
    Press Keys    up
    Press Keys    up
    Press Keys    space
    RPA.Windows.Click    ${ok_btn_id1}
    RPA.Windows.Click    id:1008
    Press Keys    up
    Press Keys    up
    Press Keys    space
    RPA.Windows.Click    ${ok_btn_id1}
    ${text_color}=    RPA.Windows.Get Attribute    id:1007    Name
    Should Be Equal  ${text_color}    Text Color
    ${background}=    RPA.Windows.Get Attribute    id:1008    Name
    Should Be Equal  ${background}    Background

Hide the Speech Display Bar by uncheck the "Visible" checkbox
    RPA.Windows.Click    id:1012
    Press Keys    alt
    Press Keys    enter
    ${element_visible}=    Run Keyword And Return Status    RPA.Windows.Get Element    id:1000
    Should Be Equal    ${element_visible}    ${False}

Check the position of Speech Display Bar
    RPA.Desktop.Press Keys    alt    s
    RPA.Windows.Click    Style
    RPA.Windows.Click    Speech Display Bar...
    RPA.Windows.Click    id:1012
    RPA.Windows.Click    id:1011
    Press Keys    alt
    Press Keys    enter
    RPA.Windows.Click    id:1000
    ${position}=    Get mouse position
    Log    Current mouse position is ${position.x}, ${position.y}