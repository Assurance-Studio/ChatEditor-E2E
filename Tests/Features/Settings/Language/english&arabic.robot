*** Settings ***
Documentation       Check "Language" feature - English&Arabic
Resource            ../../../../Resources/resources.robot
Resource            ../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor

Library    Dialogs

*** Test Cases ***
Validate "Adult Panel 20" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select language            ${english&Arabic}
    Select Symbol Set: SymbolStix without aditional vocabularies
    Create user                ArabicUser
    Maximize the window
    Reach Library of vocabs    l
    Select vocabulary    name:Arabic    ${adultPanel20}

Check that the language is associated with the available configuration for Arabic
    RPA.Desktop.Press Keys    alt    s
    RPA.Windows.Click    	Language
    # Arabic and English are enabled
    ${arabic}=    Get Attribute    id:33701    IsEnabled
    Should Contain Any    ${arabic}    1    True    "1"    "True"
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
    ${hebrew}=    Get Attribute    id:33700    IsEnabled
    Should Contain Any    ${hebrew}    0    False    "0"    "False"

Check that the menus change to the Arabic
    RPA.Windows.Get Element    name:Settings
    RPA.Windows.Get Element    name:Library
    RPA.Windows.Get Element    name:Help

Set the language to English
    RPA.Windows.Click    id:33299
    #Check that the language is associated with the available configuration for English
    RPA.Windows.Get Element    name:Settings
    RPA.Windows.Get Element    name:Library
    RPA.Windows.Get Element    name:Help
