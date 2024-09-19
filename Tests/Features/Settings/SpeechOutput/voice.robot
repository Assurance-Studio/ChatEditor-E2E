*** Settings ***
Documentation       Check "Voice" feature
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

Reach "Voice" modal
    RPA.Desktop.Press Keys    alt    s
    RPA.Windows.Click    "Speech Output"
    RPA.Windows.Click    Voice...
    ${text}=    RPA.Windows.Get Text    name:"Voice Properties Dialog"
    Should Be Equal    ${text}    Voice Properties Dialog

Adjust voice properties - voice and speed
    RPA.Windows.Click    ${voiceDropbox}
    RPA.Windows.Click    name:"Microsoft Zira Desktop - English (United States)"
    RPA.Windows.Double Click    id:MoreButton
    ${voice}=    RPA.Windows.Get Value    ${voiceDropbox}
    Should Be Equal    ${voice}    Microsoft Zira Desktop - English (United States)
    ${value}=    RPA.Windows.Get Value    id:1013
    Should Be Equal    ${value}    2

Adjust voice properties - volume and pitch
    RPA.Windows.Click    id:1026
    RPA.Windows.Click        id:1029
    ${value}=    RPA.Windows.Get Value    id:1024
    Should Be Equal    ${value}    I love my Chat Device!

Test voice settings
    Set Value    id:1024    I love you!
    RPA.Windows.Click        id:1020
    ${text}=    RPA.Windows.Get Text    name:"Voice Properties Dialog"
    Should Be Equal    ${text}    Voice Properties Dialog
    ${value}=    RPA.Windows.Get Value    id:1024
    Should Be Equal    ${value}    I love you!


Check if the changes are retained after saving them
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    enter
    RPA.Desktop.Press Keys    alt    s
    RPA.Windows.Click    "Speech Output"
    RPA.Windows.Click    Voice...
    ${voice}=    RPA.Windows.Get Value    ${voiceDropbox}
    Should Be Equal    ${voice}    Microsoft Zira Desktop - English (United States)
    ${value}=    RPA.Windows.Get Value    id:1013
    Should Be Equal    ${value}    2
    ${value}=    RPA.Windows.Get Value    id:1024
    Should Be Equal    ${value}    I love my Chat Device!
