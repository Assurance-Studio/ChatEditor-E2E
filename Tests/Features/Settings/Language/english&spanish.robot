*** Settings ***
Documentation       Check "Language" feature - English&Español
Resource            ../../../../Resources/resources.robot
Resource            ../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor

Library    Dialogs

*** Test Cases ***
Validate "Communication Journey Afasia Español SS" vocabulary
    Create new configuration of ChatEditor
    Select Nova Chat
    Select language            ${english&Español}
    Select Symbol Set: SymbolStix
    Create user                EspañolUser
    Maximize the window
    Reach Library of vocabs    b
    Select vocabulary    name:"Español de América"    name:SymbolStix     ${communicationJourneyAfasiaEspanolSS}

Check that the language is associated with the available configuration for Spanish
    RPA.Desktop.Press Keys    alt    p
    RPA.Windows.Click    Idioma
    # Spanish and English are enabled
    ${espanolAmericano}=    Get Attribute    id:33699    IsEnabled
    Should Be Equal    ${espanolAmericano}    1    formater=int|boolean
     ${ingles}=    Get Attribute    id:33299    IsEnabled
    Should Be Equal    ${ingles}    1    formater=int|boolean
    # Other languages are disabled
    ${francesCanadiense}=    Get Attribute    id:33698    IsEnabled
    Should Be Equal    ${francesCanadiense}    0    formater=int|boolean
    ${holandes}=    Get Attribute    id:1405    IsEnabled
    Should Be Equal    ${holandes}    0    formater=int|boolean
    ${aleman}=    Get Attribute    id:33303    IsEnabled
    Should Be Equal    ${aleman}    0    formater=int|boolean
    ${hebreo}=    Get Attribute    id:33700    IsEnabled
    Should Be Equal    ${hebreo}    0    formater=int|boolean
    ${arabe}=    Get Attribute    id:33701    IsEnabled
    Should Be Equal    ${arabe}    0    formater=int|boolean

Check that the menus change to the Spanish
    RPA.Windows.Get Element    name:Preferencias
    RPA.Windows.Get Element    name:Biblioteca
    RPA.Windows.Get Element    name:Ayuda

Set the language to English
    RPA.Windows.Click    id:33299
    #Check that the language is associated with the available configuration for English
    RPA.Windows.Get Element    name:Settings
    RPA.Windows.Get Element    name:Library
    RPA.Windows.Get Element    name:Help
