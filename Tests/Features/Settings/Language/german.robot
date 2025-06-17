*** Settings ***
Documentation       Check "Language" feature - Deutsch
Resource            ../../../../Resources/resources.robot
Resource            ../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor

Library    Dialogs

*** Test Cases ***
Validate "ABC 6" vocabulary
    Create new configuration of ChatEditor
    Select Nova Chat
    Select language            ${deutsch}
    Select Symbol Set: SymbolStix
    Create user                DeutschUser
    Maximize the window
    Reach Library of vocabs    b
    Select vocabulary    name:"Vorgespeicherte Vokabulare"    name:"ABC-Programme"     ${ABC6}

Check that the language is associated with the available configuration
    RPA.Desktop.Press Keys    alt    e
    RPA.Windows.Click    Sprache
    # German is enabled
    ${deutsch}=    Get Attribute    id:33303    IsEnabled
    Should Be Equal    ${deutsch}    1
    # Other languages are disabled
    ${kanadFranzosich}=    Get Attribute    id:33698    IsEnabled
    Should Be Equal    ${kanadFranzosich}    0
    ${niederlandisch}=    Get Attribute    id:1405    IsEnabled
    Should Be Equal    ${niederlandisch}    0
    ${americanSpanich}=    Get Attribute    id:33699    IsEnabled
    Should Be Equal    ${americanSpanich}    0
    ${hebraisch}=    Get Attribute    id:33700    IsEnabled
    Should Be Equal    ${hebraisch}    0
    ${arabisch}=    Get Attribute    id:33701    IsEnabled
    Should Be Equal    ${arabisch}    0
    ${englisch}=    Get Attribute    id:33299    IsEnabled
    Should Be Equal    ${englisch}    0

Check that the menus change to the chosen language
    RPA.Windows.Get Element    name:Einstellungen
    RPA.Windows.Get Element    name:Bibliothek
    RPA.Windows.Get Element    name:Hilfe
