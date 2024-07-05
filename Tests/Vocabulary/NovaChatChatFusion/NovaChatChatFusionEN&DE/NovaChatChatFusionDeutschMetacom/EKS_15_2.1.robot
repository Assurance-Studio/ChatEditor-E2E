*** Settings ***
Documentation       Check "EKS 15 2.1" DEUTSCH vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor
Library    Dialogs

*** Test Cases ***
Validate "EKS 15 2.1" vocabulary
    Create new configuration of ChatEditor
    Select Nova Chat
    Select language            ${english&Deutsch}
    Select Symbol Set: Metacom
    Create user                DeutschUser
    Maximize the window
    Reach Library of vocabs    b
    Select vocabulary    name:"Vorgespeicherte Vokabulare"    name:"Entdecke die Kraft der Sprache"     ${EKS_15_2.1}

Assertions for "EKS 15 2.1" DEUTSCH vocabulary
    # Click on a button's text - EKS 15 2.1
    Set Resolution    ${windowDeutsch}    1800    800
    ${text}    Set Variable    Geräusche wahrnehmen
    Click On Button With Text    ${text}    NovaChatChatFusion\\NovaChatChatFusionEnglish&Deutsch\\EKS_15_2.1\\gerauscheWahrnehmen.png    0.6

    Check to see if the user exist - DeutschUser

    # Check to see if the dictionary's name is included in the text box - EKS 15 2.1
    RPA.Windows.Click    ${edit_mode_btn_english&deutsch}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    "EKS 15 2.1" ist ein Original vokabular
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - EKS 15 2.1
    RPA.Desktop.Press Keys    alt    b
    RPA.Windows.Click    name:"Vorgespeicherte Vokabulare"
    RPA.Windows.Click    name:"Entdecke die Kraft der Sprache"
    ${name}=    RPA.Windows.Get Attribute    name:"EKS 15 2.1 (aktuell)"    Name
    Should Be Equal    ${name}    EKS 15 2.1 (aktuell)
