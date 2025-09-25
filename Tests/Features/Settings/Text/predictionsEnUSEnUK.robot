*** Settings ***
Documentation       Check "Prediction" feature for English US and English UK
Resource            ../../../../Resources/resources.robot
Resource            ../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor

Library    Dialogs

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

Reach "Prediction" modal
    Set Resolution    ${window}    1800    800
    RPA.Desktop.Press Keys    alt    s
    RPA.Windows.Click    Text
    RPA.Windows.Click    Prediction...

Uncheck "Static Prediction" features
    RPA.Windows.Click    id:1064
    ${isEnabled}=    Get Attribute    id:1001    IsEnabled
    Should Contain Any    ${isEnabled}    0    False    "0"    "False"

Set prediction to "British English"
    RPA.Windows.Click    id:1064
    RPA.Windows.Click    id:DropDown
    RPA.Windows.Click    name:"British English"
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys   enter

Check "British English" prediction
    Send Keys    ${speechDisplayBar}    c
    Send Keys    ${speechDisplayBar}    o
    Send Keys    ${speechDisplayBar}    l
    Send Keys    ${speechDisplayBar}   o
    ${text}    Set Variable    Colour
    Click On Button With Text    ${text}    TouchChat\\TouchChatEnglish\\spellingSS\\colour_spellingSS_keyboard.png    0.6
    ${message}=    RPA.Windows.Get Value    id:1000
    Should Be Equal  ${message}    Colour\u0020   #Unicode code for space

Clear message window
    Select Text By Shifting Left    8
    RPA.Desktop.Press Keys    delete

Set prediction to "American English"
    RPA.Desktop.Press Keys    alt    s
    RPA.Windows.Click    Text
    RPA.Windows.Click    Prediction...
    RPA.Windows.Click    id:DropDown
    RPA.Windows.Click    name:"American English"
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys   enter

Check "American English" prediction
    Send Keys    id:1000    c
    Send Keys    id:1000    o
    Send Keys    id:1000    l
    Send Keys    id:1000    o
    ${text}    Set Variable    Color
    Click On Button With Text    ${text}    TouchChat\\TouchChatEnglish\\spellingSS\\color_spellingSS_keyboard.png    0.6
    ${message}=    RPA.Windows.Get Value    id:1000
    Should Be Equal    ${message}    Color\u0020    #Unicode code for space
