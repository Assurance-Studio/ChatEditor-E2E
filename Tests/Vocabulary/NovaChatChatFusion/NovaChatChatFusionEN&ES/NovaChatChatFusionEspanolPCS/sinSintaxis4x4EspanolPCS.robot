*** Settings ***
Documentation       Check "sin sintaxis 4x4 Español PCS" ESPAÑOL vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor
Library    Dialogs

*** Test Cases ***
Validate "sin sintaxis 4x4 Español PCS" vocabulary
    Create new configuration of ChatEditor
    Select Nova Chat
    Select language            ${english&Español}
    Select Symbol Set: PCS
    Create user                EspañolUser
    Maximize the window
    Reach Library of vocabs    b
    Select vocabulary    name:"Español de América"    name:PCS     ${sinSintaxis4x4EspañolPCS}

Assertions for "sin sintaxis 4x4 Español PCS" ESPAÑOL vocabulary
    Check to see if the user exist - EspañolUser

    # Check to see if the dictionary's name is included in the text box - sin sintaxis 4x4 Español PCS
    RPA.Windows.Click    ${edit_mode_btn_english&espanol}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    El vocabulario "sin sintaxis 4x4 Español PCS"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - sin sintaxis 4x4 Español PCS
    RPA.Desktop.Press Keys    alt    b
    RPA.Windows.Click    name:"Español de América"
    RPA.Windows.Click    name:PCS
    ${name}=    RPA.Windows.Get Attribute    name:"sin sintaxis 4x4 Español PCS(Actual)"    Name
    Should Be Equal    ${name}    sin sintaxis 4x4 Español PCS(Actual)
