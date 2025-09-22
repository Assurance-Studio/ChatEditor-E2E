*** Settings ***
Documentation       Check "Language" feature - English&Nederlands
Resource            ../../../../Resources/resources.robot
Resource            ../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor

Library    Dialogs

*** Test Cases ***
Validate "myQuickChat 4 Kind SS" vocabulary
    Create new configuration of ChatEditor
    Select Nova Chat
    Select language            ${english&Nederlands}
    Select Symbol Set: SymbolStix
    Create user                NederlandsUser
    Maximize the window
    Reach Library of vocabs    b
    Select vocabulary    name:Nederlands    name:SymbolStix     ${myQuickChat4KinddSS}

Check that the language is associated with the available configuration for German
    RPA.Desktop.Press Keys    alt    i
    RPA.Windows.Click    Taal
    # Dutch and English are enabled
    ${nederlands}=    Get Attribute    id:1405    IsEnabled
    Should Contain Any    ${nederlands}    1    True    "1"    "True"
     ${engels}=    Get Attribute    id:33299    IsEnabled
    Should Contain Any    ${engels}    1    True    "1"    "True"
    # Other languages are disabled
    ${canadiesFrans}=    Get Attribute    id:33698    IsEnabled
    Should Contain Any    ${canadiesFrans}    0    False    "0"    "False"
    ${duits}=    Get Attribute    id:33303    IsEnabled
    Should Contain Any    ${duits}    0    False    "0"    "False"
    ${amerikaansSpaans}=    Get Attribute    id:33699    IsEnabled
    Should Contain Any    ${amerikaansSpaans}    0    False    "0"    "False"
    ${hebreeuws}=    Get Attribute    id:33700    IsEnabled
    Should Contain Any    ${hebreeuws}    0    False    "0"    "False"
    ${arabisch}=    Get Attribute    id:33701    IsEnabled
    Should Contain Any    ${arabisch}    0    False    "0"    "False"

Check that the menus change to Dutch
    RPA.Windows.Get Element    name:Instellingen
    RPA.Windows.Get Element    name:Bibliotheek
    RPA.Windows.Get Element    name:Help

Set the language to English
    RPA.Windows.Click    id:33299
    #Check that the language is associated with the available configuration for English
    RPA.Windows.Get Element    name:Settings
    RPA.Windows.Get Element    name:Library
    RPA.Windows.Get Element    name:Help
