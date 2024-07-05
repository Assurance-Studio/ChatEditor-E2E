*** Settings ***
Documentation       Check "MultiChat 15 Español PCS" ESPAÑOL vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor
Library    Dialogs

*** Test Cases ***
Validate "MultiChat 15 Español PCS" vocabulary
    Create new configuration of ChatEditor
    Select Nova Chat
    Select language            ${english&Español}
    Select Symbol Set: PCS
    Create user                EspañolUser
    Maximize the window
    Reach Library of vocabs    b
    Select vocabulary    name:"Español de América"    name:PCS     ${multiChat15EspanolPCS}

Assertions for "MultiChat 15 Español PCS" ESPAÑOL vocabulary
    # Click on a button's text - MultiChat 15 Español PCS
    Set Resolution    ${windowEspañol}    1800    800
    ${text}    Set Variable    Preguntas
    Click On Button With Text    ${text}    NovaChatChatFusion\\NovaChatChatFusionEnglish&Espanol\\multiChat15EspanolPCS\\preguntas.png    0.6

    Check to see if the user exist - EspañolUser

    # Check to see if the dictionary's name is included in the text box - MultiChat 15 Español PCS
    RPA.Windows.Click    ${edit_mode_btn_english&espanol}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    El vocabulario "MultiChat 15 Español PCS"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - MultiChat 15 Español PCS
    RPA.Desktop.Press Keys    alt    b
    RPA.Windows.Click    name:"Español de América"
    RPA.Windows.Click    name:PCS
    ${name}=    RPA.Windows.Get Attribute    name:"MultiChat 15 Español PCS(Actual)"    Name
    Should Be Equal    ${name}    MultiChat 15 Español PCS(Actual)
