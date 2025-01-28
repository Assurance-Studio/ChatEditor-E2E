*** Settings ***
Documentation       Check "About" feature
Resource            ../../../Resources/resources.robot
Resource            ../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor

Library    Dialogs

*** Test Cases ***
Reach "4-Basic SS" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select language            ${english}
    Select Symbol Set: SymbolStix without aditional vocabularies
    Create user                EnglishUser
    Maximize the window
    Reach Library of vocabs    l
    Select vocabulary    name:English    name:SymbolStix    ${4BasicSS}

Reach "About" modal
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    h
    # Click the About button
    RPA.Windows.Click    id:32784
    ${chatEditor}=    RPA.Windows.Get Text    id:1292
    Should Contain    ${chatEditor}    ChatEditor
    ${versionNumber}=    RPA.Windows.Get Text    id:1002
    Should Contain    ${versionNumber}    Version
    ${symbolSets}=    RPA.Windows.Get Text    id:1511
    Should Contain    ${symbolSets}    SymbolStix Symbols
    ${copyrightYear}=    RPA.Windows.Get Text    name:"Copyright© 2024 PRC-Saltillo Corporation"
    Should Match Regexp    ${copyrightYear}    Copyright© \\d{4} PRC-Saltillo Corporation

Closing the "About" box
    RPA.Windows.Click    ${ok_btn_id1}
    # Assert this by accessing "Library" section(if the "About" box is opened, you are not able to open the "Library" section)
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    l
    RPA.Windows.Get Element    name:"Resource Browser - Library"
