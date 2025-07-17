*** Settings ***
Documentation       Check "Transfer - Pages To File" feature
Resource            ../../../Resources/resources.robot
Resource            ../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor

Library    Dialogs

*** Test Cases ***
Reach "4-Basic SS" vocabulary
    Create new configuration of ChatEditor
    Select Nova Chat
    Select language            ${english}
    Select Symbol Set: SymbolStix
    Create user                EnglishUser
    Maximize the window
    Reach Library of vocabs    l
    Select vocabulary    name:English    name:SymbolStix    NONE    ${4BasicSS}

Reach "New Vocab" modal
    Reach Library of vocabs    l
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    right
    RPA.Desktop.Press Keys    right
    RPA.Desktop.Press Keys    right
    RPA.Desktop.Press Keys    right
    RPA.Desktop.Press Keys    right
    RPA.Desktop.Press Keys    right
    RPA.Desktop.Press Keys    enter
    RPA.Windows.Get Element    name:"ChatEditor • (EnglishUser)"
