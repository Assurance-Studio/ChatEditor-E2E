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
    Should Contain Any    ${espanolAmericano}    1    True    "1"    "True"
     ${ingles}=    Get Attribute    id:33299    IsEnabled
    Should Contain Any    ${ingles}    1    True    "1"    "True"
    # Other languages are disabled
    ${francesCanadiense}=    Get Attribute    id:33698    IsEnabled
    Should Contain Any    ${francesCanadiense}    0    False    "0"    "False"
    ${holandes}=    Get Attribute    id:1405    IsEnabled
    Should Contain Any    ${holandes}    0    False    "0"    "False"
    ${aleman}=    Get Attribute    id:33303    IsEnabled
    Should Contain Any    ${aleman}    0    False    "0"    "False"
    ${hebreo}=    Get Attribute    id:33700    IsEnabled
    Should Contain Any    ${hebreo}    0    False    "0"    "False"
    ${arabe}=    Get Attribute    id:33701    IsEnabled
    Should Contain Any    ${arabe}    0    False    "0"    "False"

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
