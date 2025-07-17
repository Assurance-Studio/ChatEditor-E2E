*** Settings ***
Documentation       Check "Language" feature - English&Français
Resource            ../../../../Resources/resources.robot
Resource            ../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor

Library    Dialogs

*** Test Cases ***
Validate "4 de base français SS" vocabulary
    Create new configuration of ChatEditor
    Select Nova Chat
    Select language            ${english&Français}
    Select Symbol Set: SymbolStix
    Create user                FrançaisUser
    Maximize the window
    Reach Library of vocabs    b
    Select vocabulary    name:"Canadienne-Française"    name:SymbolStix     ${4DeBaseFrançaisSS}

Check that the language is associated with the available configuration for French
    RPA.Desktop.Press Keys    alt    p
    RPA.Windows.Click    Langue
    # French and English are enabled
    ${francaisCanadien}=    Get Attribute    id:33698    IsEnabled
    Should Be Equal    ${francaisCanadien}    1    formater=int|boolean
     ${english}=    Get Attribute    id:33299    IsEnabled
    Should Be Equal    ${english}    1    formater=int|boolean
    # Other languages are disabled
    ${espagnolAmericaine}=    Get Attribute    id:33699    IsEnabled
    Should Be Equal    ${espagnolAmericaine}    0    formater=int|boolean
    ${hollandais}=    Get Attribute    id:1405    IsEnabled
    Should Be Equal    ${hollandais}    0    formater=int|boolean
    ${allemand}=    Get Attribute    id:33303    IsEnabled
    Should Be Equal    ${allemand}    0    formater=int|boolean
    ${hebreu}=    Get Attribute    id:33700    IsEnabled
    Should Be Equal    ${hebreu}    0    formater=int|boolean
    ${arabe}=    Get Attribute    id:33701    IsEnabled
    Should Be Equal    ${arabe}    0    formater=int|boolean

Check that the menus change to the French
    RPA.Windows.Get Element    name:Paramètres
    RPA.Windows.Get Element    name:Bibliothèque
    RPA.Windows.Get Element    name:Aide

Set the language to English
    RPA.Windows.Click    id:33299
    #Check that the language is associated with the available configuration for English
    RPA.Windows.Get Element    name:Settings
    RPA.Windows.Get Element    name:Library
    RPA.Windows.Get Element    name:Help
