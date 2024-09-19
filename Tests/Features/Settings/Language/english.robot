*** Settings ***
Documentation       Check "Language" feature - English
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

Check that the language is associated with the available configuration
    RPA.Desktop.Press Keys    alt    s
    RPA.Windows.Click    Language
    # English is enabled
    ${english}=    Get Attribute    id:33299    IsEnabled
    Should Be Equal    ${english}    1
    # Other languages are disabled
    ${americanSpanish}=    Get Attribute    id:33699    IsEnabled
    Should Be Equal    ${americanSpanish}    0
    ${canadianFrench}=    Get Attribute    id:33698    IsEnabled
    Should Be Equal    ${canadianFrench}    0
    ${dutch}=    Get Attribute    id:1405    IsEnabled
    Should Be Equal    ${dutch}    0
    ${german}=    Get Attribute    id:33303    IsEnabled
    Should Be Equal    ${german}    0
    ${hebrew}=    Get Attribute    id:33700    IsEnabled
    Should Be Equal    ${hebrew}    0
    ${arabic}=    Get Attribute    id:33701    IsEnabled
    Should Be Equal    ${arabic}    0

Check that the menus change to the chosen language
    RPA.Windows.Get Element    name:Settings
    RPA.Windows.Get Element    name:Library
    RPA.Windows.Get Element    name:Help
