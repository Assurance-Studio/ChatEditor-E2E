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
    Should Be Equal    ${nederlands}    1    formater=int|boolean
     ${engels}=    Get Attribute    id:33299    IsEnabled
    Should Be Equal    ${engels}    1
    # Other languages are disabled
    ${canadiesFrans}=    Get Attribute    id:33698    IsEnabled
    Should Be Equal    ${canadiesFrans}    0
    ${duits}=    Get Attribute    id:33303    IsEnabled
    Should Be Equal    ${duits}    0
    ${amerikaansSpaans}=    Get Attribute    id:33699    IsEnabled
    Should Be Equal    ${amerikaansSpaans}    0
    ${hebreeuws}=    Get Attribute    id:33700    IsEnabled
    Should Be Equal    ${hebreeuws}    0
    ${arabisch}=    Get Attribute    id:33701    IsEnabled
    Should Be Equal    ${arabisch}    0

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
