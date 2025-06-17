*** Settings ***
Documentation       Check "Essence 60 Español" SPANISH vocabulary
Resource            ../../../../Resources/resources.robot
Resource            ../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor
Library    Dialogs

*** Test Cases ***
Validate "Essence 60 Español" vocabulary
    Create new configuration of ChatEditor
    Select Dialogue
    Select language            ${english&Español}
    Create user                EspañolUser
    Maximize the window
    Reach Library of vocabs    b
    Select vocabulary          name:"Español de América"    name:Essence    ${essence60Espanol}

Assertions for "Essence 60 Español"
    # Click on a button's text - Essence 60 Español
    Set Resolution    ${windowEspañol}    1800    800
    Get Element    name:Ayuda    timeout=5
    ${text}    Set Variable    Necesito Ayuda
    Click On Button With Text    ${text}    Dialogue\\DialogueSpanish\\essence60Espanol\\necesitoAyuda.png    0.6
    ${message}=    RPA.Windows.Get Value    id:1000
    Should Contain    ${message}    Necesito Ayuda

    Check to see if the user exist - EspañolUser

    # Check to see if the dictionary's name is included in the text box - Essence 60 Español
    RPA.Windows.Click    ${edit_mode_btn_english&espanol}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    El vocabulario "Essence 60 Español"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - Essence 60 Español
    RPA.Desktop.Press Keys    alt    b
    RPA.Windows.Click    name:"Español de América"
    RPA.Windows.Click    name:Essence
    ${name}=    RPA.Windows.Get Attribute    name:"Essence 60 Español(Actual)"    Name
    Should Be Equal    ${name}    Essence 60 Español(Actual)
