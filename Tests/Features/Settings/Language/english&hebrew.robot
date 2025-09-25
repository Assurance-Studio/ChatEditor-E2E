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
    Should Contain Any    ${hebrew}    1    True    "1"    "True"
     ${english}=    Get Attribute    id:33299    IsEnabled
    Should Contain Any    ${english}    1    True    "1"    "True"
    # Other languages are disabled
    ${americanSpanish}=    Get Attribute    id:33699    IsEnabled
    Should Contain Any    ${americanSpanish}    0    False    "0"    "False"
    ${canadianFrench}=    Get Attribute    id:33698    IsEnabled
    Should Contain Any    ${canadianFrench}    0    False    "0"    "False"
    ${dutch}=    Get Attribute    id:1405    IsEnabled
    Should Contain Any    ${dutch}    0    False    "0"    "False"
    ${german}=    Get Attribute    id:33303    IsEnabled
    Should Contain Any    ${german}    0    False    "0"    "False"
    ${arabic}=    Get Attribute    id:33701    IsEnabled
    Should Contain Any    ${arabic}    0    False    "0"    "False"

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
