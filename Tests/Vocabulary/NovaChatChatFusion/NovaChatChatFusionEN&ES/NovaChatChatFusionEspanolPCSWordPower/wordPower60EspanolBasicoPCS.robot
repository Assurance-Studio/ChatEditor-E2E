*** Settings ***
Documentation       Check "WordPower60 Español Básico PCS" ESPAÑOL vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor
Library    Dialogs

*** Test Cases ***
Validate "WordPower60 Español Básico PCS" vocabulary
    Create new configuration of ChatEditor
    Select Nova Chat
    Select language            ${english&Español}
    Select Symbol Set: PCS
    Create user                EspañolUser
    Maximize the window
    Reach Library of vocabs    b
    Select vocabulary    name:"Español de América"    name:PCS    name:WordPower     ${wordPower60EspanolBasicoPCS}

Assertions for "WordPower60 Español Básico PCS" ESPAÑOL vocabulary
    # Click on a button's text - WordPower60 Español Básico PCS
    Set Resolution    ${windowEspañol}    1800    800
    ${text}    Set Variable    GENTE
    Click On Button With Text    ${text}    NovaChatChatFusion\\NovaChatChatFusionEnglish&Espanol\\wordPower60EspanolBasicoPCS\\gente.png    0.6

    Check to see if the user exist - EspañolUser

    # Check to see if the dictionary's name is included in the text box - WordPower60 Español Básico PCS
    RPA.Windows.Click    ${edit_mode_btn_english&espanol}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    El vocabulario "WordPower60 Español Básico PCS"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - WordPower60 Español Básico PCS
    RPA.Desktop.Press Keys    alt    b
    RPA.Windows.Click    name:"Español de América"
    RPA.Windows.Click    name:PCS
    RPA.Windows.Click    name:WordPower
    ${name}=    RPA.Windows.Get Attribute    name:"WordPower60 Español Básico PCS(Actual)"    Name
    Should Be Equal    ${name}    WordPower60 Español Básico PCS(Actual)
