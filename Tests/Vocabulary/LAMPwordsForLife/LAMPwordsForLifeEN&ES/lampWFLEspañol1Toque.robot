*** Settings ***
Documentation       Check "LAMP WFL - Español 1 Toque" FRANCAISE vocabulary
Resource            ../../../../Resources/resources.robot
Resource            ../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor
Library    Dialogs

*** Test Cases ***
Validate "LAMP WFL - Español 1 Toque" vocabulary
    Create new configuration of ChatEditor
    Select Words For Life (Nova Edition)
    Select language    ${english&Español}
    Create user                EspañolUser
    Maximize the window
    Reach Library of vocabs    b
    Select vocabulary    name:"Español de América"    name:LAMP    ${lampWFLEspanol1Toque}

Assertions
    # Click on a button's text - LAMP WFL - Español 1 Toque
    Set Resolution    ${windowEspañol}   1800    800
    Get Element    name:Ayuda    timeout=5
    ${text}    Set Variable    pequeño
    Click On Button With Text    ${text}    LAMPwordsForLife\\lampWFLEspanol1Toque\\pequeno.png    0.6
    ${message}=    RPA.Windows.Get Value    id:1000
    Should Contain    ${message}    Pequeño

    Check to see if the user exist - EspañolUser

    # Check to see if the dictionary's name is included in the text box - LAMP WFL - Español 1 Toque
    RPA.Windows.Click    ${edit_mode_btn_english&espanol}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    El vocabulario "LAMP WFL - Español 1 Toque"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - LAMP WFL - Español 1 Toque
    RPA.Desktop.Press Keys    alt    b
    RPA.Windows.Click    name:"Español de América"
    RPA.Windows.Click    name:LAMP
    ${name}=    RPA.Windows.Get Attribute    name:"LAMP WFL - Español 1 Toque(Actual)"    Name
    Should Be Equal    ${name}    LAMP WFL - Español 1 Toque(Actual)
