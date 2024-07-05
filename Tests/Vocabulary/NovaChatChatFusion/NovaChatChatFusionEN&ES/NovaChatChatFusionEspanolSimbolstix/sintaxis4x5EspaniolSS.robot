*** Settings ***
Documentation       Check "sintaxis 4x5 Español SS" ESPAÑOL vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor
Library    Dialogs

*** Test Cases ***
Validate "sintaxis 4x5 Español SS" vocabulary
    Create new configuration of ChatEditor
    Select Nova Chat
    Select language            ${english&Español}
    Select Symbol Set: SymbolStix
    Create user                EspañolUser
    Maximize the window
    Reach Library of vocabs    b
    Select vocabulary    name:"Español de América"    name:SymbolStix     ${sintaxis4x5EspañolSS}

Assertions for "sintaxis 4x5 Español SS" ESPAÑOL vocabulary
    Check to see if the user exist - EspañolUser

    # Check to see if the dictionary's name is included in the text box - sintaxis 4x5 Español SS
    RPA.Windows.Click    ${edit_mode_btn_english&espanol}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    El vocabulario "sintaxis 4x5 Español SS"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - sintaxis 4x5 Español SS
    RPA.Desktop.Press Keys    alt    b
    RPA.Windows.Click    name:"Español de América"
    RPA.Windows.Click    name:SymbolStix
    ${name}=    RPA.Windows.Get Attribute    name:"sintaxis 4x5 Español SS(Actual)"    Name
    Should Be Equal    ${name}    sintaxis 4x5 Español SS(Actual)
