*** Settings ***
Documentation       Check "Button Style" feature
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

Reach "Button Style" modal
    Set Resolution    ${window}    1800    800
    RPA.Desktop.Press Keys    alt    s
    RPA.Windows.Click    Style
    RPA.Windows.Click    Button Style...
    ${text}=    RPA.Windows.Get Text    name:"Button Style"
    Should Be Equal    ${text}    Button Style

Check to see if the icons disappear
    RPA.windows.Click    id:1576
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    enter
    #Click the button PHRASES without any icon
    ${text}    Set Variable    PHRASES
    Click On Button With Text    ${text}    TouchChat\\TouchChatEnglish\\spellingSS\\phrasesWithoutIcon.png    0.6

Use icons for the entire button area
    RPA.Desktop.Press Keys    alt    s
    RPA.Windows.Click    Style
    RPA.Windows.Click    Button Style...
    RPA.windows.Click    id:1576
    RPA.windows.Click    id:1099
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    enter
    #Click the button Good Morning
    ${text}    Set Variable    Good Morning
    Click On Button With Text    ${text}    TouchChat\\TouchChatEnglish\\spellingSS\\goodMorning.png    0.6
    ${message}=    RPA.Windows.Get Value    ${speechDisplayBar}
    Should Contain    ${message}    Good morning, how are you?

Turn off the appearance of navigation icons
    RPA.Desktop.Press Keys    alt    s
    RPA.Windows.Click    Style
    RPA.Windows.Click    Button Style...
    #Activate "No Show" checkbox
    RPA.windows.Click    id:10005
    #Check that the "Size" setting for navigation icons is disabled
    ${isEnabled}=    Get Attribute    id:1102    IsEnabled
    Should Be Equal    ${isEnabled}    0
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    enter
    ${text}    Set Variable    KEYBOARD
    Click On Button With Text    ${text}    TouchChat\\TouchChatEnglish\\spellingSS\\keyboardWithoutNavigationIcons.png    0.6

Turn on the appearance of navigation icons
    RPA.Desktop.Press Keys    alt    s
    RPA.Windows.Click    Style
    RPA.Windows.Click    Button Style...
    #Uncheck "No Show"
    RPA.windows.Click    id:10005
    #Check that the "Size" setting for navigation icons is enabled
    ${isEnabled}=    Get Attribute    id:1102    IsEnabled
    Should Be Equal    ${isEnabled}    1
    #Change the size of the navigation icons
    RPA.windows.Click    id:1102
    RPA.Windows.Click    name:"1 - Smallest"
    ${smallest}=    RPA.Windows.Get Value    id:1102
    Should Be Equal  ${smallest}    1 - Smallest
    RPA.windows.Click    id:1102
    RPA.Windows.Click    name:"2 - Small"
    ${small}=    RPA.Windows.Get Value    id:1102
    Should Be Equal  ${small}    2 - Small
    RPA.windows.Click    id:1102
    RPA.Windows.Click    name:"3 - Normal (Default)"
    ${normal}=    RPA.Windows.Get Value    id:1102
    Should Be Equal  ${normal}    3 - Normal (Default)
    RPA.windows.Click    id:1102
    RPA.Windows.Click    name:"4 - Large"
    ${large}=    RPA.Windows.Get Value    id:1102
    Should Be Equal  ${large}    4 - Large
    RPA.windows.Click    id:1102
    RPA.Windows.Click    name:"5 - Largest"
    ${largest}=    RPA.Windows.Get Value    id:1102
    Should Be Equal  ${largest}    5 - Largest

Check the "Saturation" setting
    #Uncheck "Saturation"
    RPA.windows.Click    id:1296
    #Check that the saturation percent is disabled
    ${isEnabled}=    Get Attribute    id:1297    IsEnabled
    Should Be Equal    ${isEnabled}    0
    #Check that the saturation percent adjust
    RPA.windows.Click    id:1296
    RPA.windows.Click    id:1297
    RPA.windows.Click    name:"35 %"
    ${percent}=    RPA.Windows.Get Value    id:1297
    Should Be Equal  ${percent}    35 %
