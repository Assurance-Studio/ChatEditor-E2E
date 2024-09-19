*** Settings ***
Documentation       Check "Pronunciations" feature
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

Reach "Pronunciations" modal
    RPA.Desktop.Press Keys    alt    s
    RPA.Windows.Click    "Speech Output"
    RPA.Windows.Click    name:Pronunciations...
    ${text}=    RPA.Windows.Get Text    name:Pronunciations
    Should Be Equal    ${text}    Pronunciations

Add new pronunciation
    RPA.Windows.Click    id:32994
    Send Keys    id:1093    john
    Send Keys    id:1094    steve
    #Check the functionality of the "Pronounce It" button
    RPA.Windows.Click    id:33091
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    enter
    ${pronounce}=          RPA.Windows.Get Element    name:john
    ${pronounceAs}=        RPA.Windows.Get Element    name:steve

Check if "Pronunciations" feature works
    RPA.Windows.Click    ${ok_btn_id1}
    Send Keys    ${speechDisplayBar}    j
    Send Keys    ${speechDisplayBar}    o
    Send Keys    ${speechDisplayBar}    h
    Send Keys    ${speechDisplayBar}    n
    RPA.Desktop.Press Keys    space
    ${message}=    RPA.Windows.Get Value    ${speechDisplayBar}
    Should Be Equal    ${message}    John\u0020    #Unicode code for space

Edit your pronunciation
    RPA.Desktop.Press Keys    alt    s
    RPA.Windows.Click    "Speech Output"
    RPA.Windows.Click    name:Pronunciations...
    RPA.Windows.Click    name:john
    RPA.Windows.Click    id:32996
    Send Keys    id:1093    adam
    RPA.Desktop.Press Keys    tab
    Send Keys    id:1094    daniel
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    enter
    ${abbreviation}=    RPA.Windows.Get Element    name:adam
    ${expandTo}=        RPA.Windows.Get Element    name:daniel

Check if "Pronunciations" feature works after editing it
    RPA.Windows.Click    ${ok_btn_id1}
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Press Keys    delete
    Send Keys    ${speechDisplayBar}    a
    Send Keys    ${speechDisplayBar}    d
    Send Keys    ${speechDisplayBar}    a
    Send Keys    ${speechDisplayBar}    m
    RPA.Desktop.Press Keys    space
    ${message}=    RPA.Windows.Get Value    ${speechDisplayBar}
    Should Be Equal    ${message}    Adam\u0020    #Unicode code for space

Delete the custom pronunciation
    RPA.Desktop.Press Keys    alt    s
    RPA.Windows.Click    "Speech Output"
    RPA.Windows.Click    name:Pronunciations...
    RPA.Windows.Click    name:adam
    RPA.Windows.Click    id:32997
    ${text}=    RPA.Windows.Get Text    id:65535
    Should Be Equal    ${text}    Delete the pronunciation for the word "adam" ?
    RPA.Windows.Click    id:7
    RPA.Windows.Click    id:32997
    RPA.Windows.Click    id:6
    RPA.Windows.Click    ${ok_btn_id1}

Check that the custom pronunciation has been deleted
    RPA.Desktop.Press Keys    tab
    RPA.Desktop.Press Keys    delete
    Send Keys    ${speechDisplayBar}    a
    Send Keys    ${speechDisplayBar}    d
    Send Keys    ${speechDisplayBar}    a
    Send Keys    ${speechDisplayBar}    m
    RPA.Desktop.Press Keys    space
    ${message}=    RPA.Windows.Get Value    ${speechDisplayBar}
    Should Be Equal    ${message}    Adam\u0020    #Unicode code for space
