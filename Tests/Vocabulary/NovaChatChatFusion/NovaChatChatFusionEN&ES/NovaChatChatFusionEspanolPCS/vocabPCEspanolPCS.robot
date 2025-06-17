*** Settings ***
Documentation       Check "WordPower25 Español PCS" ESPAÑOL vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor
Library    Dialogs

*** Test Cases ***
Validate "VocabPC Español PCS" vocabulary
    Create new configuration of ChatEditor
    Select Nova Chat
    Select language            ${english&Español}
    Select Symbol Set: PCS
    Create user                EspañolUser
    Maximize the window
    Reach Library of vocabs    b
    Select vocabulary    name:"Español de América"    name:PCS    NONE     ${vocabPCEspañolPCS}

Assertions for "VocabPC Español PCS" ESPAÑOL vocabulary
    # Click on a button's text - VocabPC Español PCS
    Set Resolution    ${windowEspañol}    1800    800
    Get Element    name:Ayuda    timeout=5
    ${text}    Set Variable    yo quiero
    Click On Button With Text    ${text}    NovaChatChatFusion\\NovaChatChatFusionEnglish&Espanol\\vocabPCEspaniolPCS\\yoQuiero.png    0.6
    ${message}=    RPA.Windows.Get Value    id:1000
    Should Contain    ${message}    Yo quiero

    Check to see if the user exist - EspañolUser

    # Check to see if the dictionary's name is included in the text box - VocabPC Español PCS
    RPA.Windows.Click    ${edit_mode_btn_english&espanol}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    El vocabulario "VocabPC Español PCS"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - VocabPC Español PCS
    RPA.Desktop.Press Keys    alt    b
    RPA.Windows.Click    name:"Español de América"
    RPA.Windows.Click    name:PCS
    ${name}=    RPA.Windows.Get Attribute    name:"VocabPC Español PCS(Actual)"    Name
    Should Be Equal    ${name}    VocabPC Español PCS(Actual)
