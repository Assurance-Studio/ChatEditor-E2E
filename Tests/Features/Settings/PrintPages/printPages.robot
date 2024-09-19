*** Settings ***
Documentation       Check "Print Pages" feature
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

Reach "Print Pages" modal
    RPA.Desktop.Press Keys    alt    s
    RPA.Windows.Click    Print Pages...
    ${text}=    RPA.Windows.Get Text    name:"Print Pages"
    Should Be Equal    ${text}    Print Pages
    ${text1}=    RPA.Windows.Get Text    id:1563
    Should Be Equal    ${text1}    Vocab: Spelling SS
Select all pages
    RPA.Windows.Click    id:1561
    ${text}=    RPA.Windows.Get Text    id:1561
    Should Be Equal    ${text}    Deselect All Pages

Deselect all pages
    RPA.Windows.Click    id:1561
    ${text}=    RPA.Windows.Get Text    id:1561
    Should Be Equal    ${text}    Select All Pages

Print pages
    RPA.Windows.Click    id:1561
    RPA.Windows.Click    id:1549
    RPA.Windows.Get Element    name:Print
    RPA.Windows.Click    id:2

Try to print pages when they are deselected
    RPA.Windows.Click    id:1561
    RPA.Windows.Click    id:1549
    ${text}=    RPA.Windows.Get Text    id:65535
    Should Be Equal    ${text}    Place a check mark on the pages to be printed.
    RPA.Windows.Click    ${ok_btn_id2}

Try to save pages when they are deselected
    RPA.Windows.Click    id:1558
    ${text}=    RPA.Windows.Get Text    id:65535
    Should Be Equal    ${text}    Place a check mark on the pages to be saved as images.
    RPA.Windows.Click    ${ok_btn_id2}

Save image of checked pages
    RPA.Windows.Click    id:1561
    RPA.Windows.Click    id:1558
    RPA.Windows.Click    ${ok_btn_id1}
    RPA.Windows.Get Element    name:"Saving Pages as PNG Images was successful."    timeout=40
    RPA.Windows.Click    ${ok_btn_id2}
    Delete saved pages

Save the changes
    RPA.Windows.Click    ${ok_btn_id2}
    Control Window    name:"ChatEditor • (EnglishUser)"
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    The vocabulary "Spelling SS"
    RPA.Windows.Click    id:7
