*** Settings ***
Documentation       Check "Language" feature - English&Hebrew
Resource            ../../../../Resources/resources.robot
Resource            ../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor

Library    Dialogs

*** Test Cases ***
Validate "Adults Board" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select language            ${english&Hebrew}
    Select Symbol Set: SymbolStix without aditional vocabularies
    Create user                HebrewUser
    Maximize the window
    Reach Library of Hebrew vocabs
    Select vocabulary    name:Hebrew    ${adultsBoard}

Check that the language is associated with the available configuration for Hebrew
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    enter
    RPA.Windows.Click    	name:שפה
    # Hebrew and English are enabled
    ${hebrew}=    Get Attribute    id:33700    IsEnabled
    Should Be Equal    ${hebrew}    1    formater=int|boolean
     ${english}=    Get Attribute    id:33299    IsEnabled
    Should Be Equal    ${english}    1    formater=int|boolean
    # Other languages are disabled
    ${americanSpanish}=    Get Attribute    id:33699    IsEnabled
    Should Be Equal    ${americanSpanish}    0    formater=int|boolean
    ${canadianFrench}=    Get Attribute    id:33698    IsEnabled
    Should Be Equal    ${canadianFrench}    0    formater=int|boolean
    ${dutch}=    Get Attribute    id:1405    IsEnabled
    Should Be Equal    ${dutch}    0    formater=int|boolean
    ${german}=    Get Attribute    id:33303    IsEnabled
    Should Be Equal    ${german}    0    formater=int|boolean
    ${arabic}=    Get Attribute    id:33701    IsEnabled
    Should Be Equal    ${arabic}    0    formater=int|boolean

Check that the menus change to the Hebrew
    RPA.Windows.Get Element    name:הגדרות
    RPA.Windows.Get Element    name:ספריה
    RPA.Windows.Get Element    name:עזרה

Set the language to English
    RPA.Windows.Click    id:33299
    #Check that the language is associated with the available configuration for English
    RPA.Windows.Get Element    name:Settings
    RPA.Windows.Get Element    name:Library
    RPA.Windows.Get Element    name:Help
