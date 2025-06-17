*** Settings ***
Documentation       Check "Automatic Capitalization" feature
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

Check if "Automatic Capitalization" works
    Send Keys    ${speechDisplayBar}    r
    Send Keys    ${speechDisplayBar}    u
    Send Keys    ${speechDisplayBar}    n
    ${message}=    RPA.Windows.Get Value    ${speechDisplayBar}
    Should Be Equal    ${message}    Run
    Send Keys    ${speechDisplayBar}    .
    Send Keys    ${speechDisplayBar}    n
    Send Keys    ${speechDisplayBar}    o
    Send Keys    ${speechDisplayBar}    w
    ${message}=    RPA.Windows.Get Value    ${speechDisplayBar}
    Should Be Equal    ${message}    Run.Now

Clear message window
    Select Text By Shifting Left    8
    RPA.Desktop.Press Keys    delete

Disable "Automatic Capitalization" feature
    RPA.Desktop.Press Keys    alt    s
    RPA.Windows.Click    Text
    RPA.Windows.Click    Automatic Capitalization

Check if "Automatic Capitalization" not works
    Send Keys    ${speechDisplayBar}    r
    Send Keys    ${speechDisplayBar}    u
    Send Keys    ${speechDisplayBar}    n
    ${message}=    RPA.Windows.Get Value    ${speechDisplayBar}
    Should Be Equal    ${message}    run
    Send Keys    ${speechDisplayBar}    .
    Send Keys    ${speechDisplayBar}    n
    Send Keys    ${speechDisplayBar}    o
    Send Keys    ${speechDisplayBar}    w
    ${message}=    RPA.Windows.Get Value    ${speechDisplayBar}
    Should Be Equal    ${message}    run.now

