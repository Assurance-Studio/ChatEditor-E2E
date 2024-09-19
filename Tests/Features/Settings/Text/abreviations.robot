*** Settings ***
Documentation       Check "Abbreviations" feature
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

Reach "Abbreviations" modal
    RPA.Desktop.Press Keys    alt    s
    RPA.Windows.Click    Abbreviations...
    ${text}=    RPA.Windows.Get Text    name:Abbreviations
    Should Be Equal    ${text}    Abbreviations

Add new abbreviations
    RPA.Windows.Click    id:32980
    Send Keys    id:1089    fyi
    Send Keys    id:1090    For your information
    Press Keys    alt
    Press Keys    enter
    RPA.Windows.Click    id:DownPageButton
    RPA.Windows.Click    id:DownPageButton
    RPA.Windows.Click    id:DownPageButton
    ${abbreviation}=    RPA.Windows.Get Element    name:fyi.
    ${expandTo}=        RPA.Windows.Get Element    name:"For your information"

Check if "Abbreviations" feature works
    RPA.Windows.Click    id:1
    Send Keys    id:1000    f
    Send Keys    id:1000    y
    Send Keys    id:1000    i
    Send Keys    id:1000    .
    ${message}=    RPA.Windows.Get Value    id:1000
    Should Be Equal    ${message}    For your information\u0020    #Unicode code for space

Edit your abbreviation
    RPA.Desktop.Press Keys    alt    s
    RPA.Windows.Click    Abbreviations...
    RPA.Windows.Click    id:DownPageButto
    RPA.Windows.Click    id:DownPageButton
    RPA.Windows.Click    id:DownPageButton
    RPA.Windows.Click    name:fyi.
    RPA.Windows.Click    id:32983
    Send Keys    id:1089    hay
    Press Keys    tab
    Send Keys    id:1090    How are you
    Press Keys    alt
    Press Keys    enter
    ${abbreviation}=    RPA.Windows.Get Element    name:hay.
    ${expandTo}=        RPA.Windows.Get Element    name:"How are you"

Check if "Abbreviations" feature works after editing it
    RPA.Windows.Click    id:1
    Press Keys    tab
    Press Keys    delete
    Send Keys    id:1000    h
    Send Keys    id:1000    a
    Send Keys    id:1000    y
    Send Keys    id:1000    .
    ${message}=    RPA.Windows.Get Value    id:1000
    Should Be Equal    ${message}    How are you\u0020    #Unicode code for space

Delete the custom abbreviation
    RPA.Desktop.Press Keys    alt    s
    RPA.Windows.Click    Abbreviations...
    RPA.Windows.Click    id:DownPageButton
    RPA.Windows.Click    id:DownPageButton
    RPA.Windows.Click    id:DownPageButton
    RPA.Windows.Click    name:hay.
    RPA.Windows.Click    id:32982
    RPA.Windows.Click    id:6
    RPA.Windows.Click    id:1

Check that the custom abbreviation has been deleted
    Press Keys    tab
    Press Keys    delete
    Send Keys    id:1000    h
    Send Keys    id:1000    a
    Send Keys    id:1000    y
    Send Keys    id:1000    .
    ${message}=    RPA.Windows.Get Value    id:1000
    Should Be Equal    ${message}    Hay.

