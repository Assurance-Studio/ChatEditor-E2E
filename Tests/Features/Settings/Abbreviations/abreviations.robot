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
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    enter
    RPA.Windows.Click    ${page_down_button}
    RPA.Windows.Click    ${page_down_button}
    RPA.Windows.Click    ${page_down_button}
    ${abbreviation}=    RPA.Windows.Get Element    name:fyi.
    ${expandTo}=        RPA.Windows.Get Element    name:"For your information"

Check if "Abbreviations" feature works
    RPA.Windows.Click    ${ok_btn_id1}
    Send Keys    ${speechDisplayBar}    f
    Send Keys    ${speechDisplayBar}    y
    Send Keys    ${speechDisplayBar}    i
    Send Keys    ${speechDisplayBar}    .
    ${message}=    RPA.Windows.Get Value    ${speechDisplayBar}
    Should Be Equal    ${message}    For your information\u0020    #Unicode code for space

Edit your abbreviation
    RPA.Desktop.Press Keys    alt    s
    RPA.Windows.Click    Abbreviations...
    RPA.Windows.Click    ${page_down_button}
    RPA.Windows.Click    ${page_down_button}
    RPA.Windows.Click    ${page_down_button}
    RPA.Windows.Click    name:fyi.
    RPA.Windows.Click    id:32983
    Send Keys    id:1089    hay
    RPA.Desktop.Press Keys    tab
    Send Keys    id:1090    How are you
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    enter
    ${abbreviation}=    RPA.Windows.Get Element    name:hay.
    ${expandTo}=        RPA.Windows.Get Element    name:"How are you"

Check if "Abbreviations" feature works after editing it
    RPA.Windows.Click    ${ok_btn_id1}
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Press Keys    delete
    Send Keys    ${speechDisplayBar}    h
    Send Keys    ${speechDisplayBar}    a
    Send Keys    ${speechDisplayBar}    y
    Send Keys    ${speechDisplayBar}    .
    ${message}=    RPA.Windows.Get Value    ${speechDisplayBar}
    Should Be Equal    ${message}    How are you\u0020    #Unicode code for space

Delete the custom abbreviation
    RPA.Desktop.Press Keys    alt    s
    RPA.Windows.Click    Abbreviations...
    RPA.Windows.Click    ${page_down_button}
    RPA.Windows.Click    ${page_down_button}
    RPA.Windows.Click    ${page_down_button}
    RPA.Windows.Click    name:hay.
    RPA.Windows.Click    id:32982
    RPA.Windows.Click    id:6
    RPA.Windows.Click    ${ok_btn_id1}

Check that the custom abbreviation has been deleted
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Press Keys    delete
    Send Keys    ${speechDisplayBar}    h
    Send Keys    ${speechDisplayBar}    a
    Send Keys    ${speechDisplayBar}    y
    Send Keys    ${speechDisplayBar}    .
    ${message}=    RPA.Windows.Get Value    ${speechDisplayBar}
    Should Be Equal    ${message}    Hay.

