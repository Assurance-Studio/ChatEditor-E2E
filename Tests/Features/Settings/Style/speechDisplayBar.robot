*** Settings ***
Documentation       Check "Speech Display Bar" feature
Resource            ../../../../Resources/resources.robot
Resource            ../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor

Library    Dialogs
Library    Process
Library    XML
Library    Collections

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
    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    space
    RPA.Windows.Click    ${ok_btn_id1}
    RPA.Windows.Click    id:1008
    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    space
    RPA.Windows.Click    ${ok_btn_id1}
    ${text_color}=    RPA.Windows.Get Attribute    id:1007    Name
    Should Be Equal  ${text_color}    Text Color
    ${background}=    RPA.Windows.Get Attribute    id:1008    Name
    Should Be Equal  ${background}    Background

Hide the Speech Display Bar by uncheck the "Visible" checkbox
    RPA.Windows.Click    id:1012
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    enter
    ${element_visible}=    Run Keyword And Return Status    RPA.Windows.Get Element    ${speechDisplayBar}
    Should Be Equal    ${element_visible}    ${False}

Check the position of Speech Display Bar
    RPA.Desktop.Press Keys    alt    s
    RPA.Windows.Click    Style
    RPA.Windows.Click    Speech Display Bar...
    RPA.Windows.Click    id:1012
    RPA.Windows.Click    id:1011
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    enter
    #Click the SDB
    RPA.Windows.Click    ${speechDisplayBar}
    #Get the mouse position
    ${position}=    Get mouse position
    #Get the display dimensions
    ${display_dimensions}=    Get Display Dimensions
    #Obtain the height of the display
    ${dimensions_str}=    Evaluate    '${display_dimensions}'.split("region:")[1]
    ${screen_height}=    Evaluate    int('${dimensions_str}'.split(",")[3])
    #Assert that the SDB is at the bottom of the screen
    Should Be True    ${position.y}>=${screen_height}*0.75

Check if can scroll contents of SDB when unchecked
    RPA.Desktop.Press Keys    alt    s
    RPA.Windows.Click    Style
    RPA.Windows.Click    Speech Display Bar...
    RPA.Windows.Click    id:1019
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    enter
    #Getting the scroll bar that becomes visible
    ${element_visible}=    Run Keyword And Return Status    RPA.Windows.Get Element    id:NonClientVerticalScrollBar
    Should Be Equal    ${element_visible}    ${True}

Verify if clicking SDB when unchecked does not speak
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    s
    RPA.Windows.Click    Style
    RPA.Windows.Click    Speech Display Bar...
    #Uncheck "Tap To Speak"
    RPA.Windows.Click    id:1023
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    enter
    Send Keys    ${speechDisplayBar}    For your information
    #Tap the SDB
    RPA.Windows.Click    ${speechDisplayBar}
