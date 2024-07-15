*** Settings ***
Documentation       Check "RehaFoXX 2.0 24 PCS" DEUTSCH vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor
Library    Dialogs

*** Test Cases ***
Validate "RehaFoXX 2.0 24 PCS" vocabulary
    Create new configuration of ChatEditor
    Select Nova Chat
    Select language            ${english&Deutsch}
    Select Symbol Set: PCS
    Create user                DeutschUser
    Maximize the window
    Reach Library of vocabs    b
    Select vocabulary    name:"Vorgespeicherte Vokabulare"    name:"RehaFoXX-Programme"     ${rehaFoXX2.0_24PCS}

Assertions for "RehaFoXX 2.0 24 PCS" DEUTSCH vocabulary
    # Click on a button's text - RehaFoXX 2.0 24 PCS
    Set Resolution    ${windowDeutsch}    1800    800
    Get Element    name:Hilfe    timeout=5
    ${text}    Set Variable    Über mich
    Click On Button With Text    ${text}    NovaChatChatFusion\\NovaChatChatFusionEnglish&Deutsch\\rehaFoXX2.0_24PCS\\uberMich.png    0.6

    Check to see if the user exist - DeutschUser

    # Check to see if the dictionary's name is included in the text box - RehaFoXX 2.0 24 PCS
    RPA.Windows.Click    ${edit_mode_btn_english&deutsch}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    "RehaFoXX 2.0 24 PCS" ist ein Original vokabular
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - RehaFoXX 2.0 24 PCS
    RPA.Desktop.Press Keys    alt    b
    RPA.Windows.Click    name:"Vorgespeicherte Vokabulare"
    RPA.Windows.Click    name:"RehaFoXX-Programme"
    ${name}=    RPA.Windows.Get Attribute    name:"RehaFoXX 2.0 24 PCS (aktuell)"    Name
    Should Be Equal    ${name}    RehaFoXX 2.0 24 PCS (aktuell)
