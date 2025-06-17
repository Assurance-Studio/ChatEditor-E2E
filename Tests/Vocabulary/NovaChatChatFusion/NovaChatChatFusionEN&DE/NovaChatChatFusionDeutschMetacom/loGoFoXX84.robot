*** Settings ***
Documentation       Check "LoGoFoXX 84" DEUTSCH vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor
Library    Dialogs

*** Test Cases ***
Validate "LoGoFoXX 84" vocabulary
    Create new configuration of ChatEditor
    Select Nova Chat
    Select language            ${english&Deutsch}
    Select Symbol Set: Metacom
    Create user                DeutschUser
    Maximize the window
    Reach Library of vocabs    b
    Select vocabulary    name:"Vorgespeicherte Vokabulare"    name:"LoGoFoXX-Programme"     ${loGoFoXX84}

Assertions for "LoGoFoXX 84" DEUTSCH vocabulary
    # Click on a button's text - LoGoFoXX 84
    Set Resolution    ${windowDeutsch}    1800    800
    Get Element    name:Hilfe    timeout=5
    ${text}    Set Variable    Sätze
    Click On Button With Text    ${text}    NovaChatChatFusion\\NovaChatChatFusionEnglish&Deutsch\\loGoFoXX84_2.0\\satze.png    0.6

    Check to see if the user exist - DeutschUser

    # Check to see if the dictionary's name is included in the text box - LoGoFoXX 84
    RPA.Windows.Click    ${edit_mode_btn_english&deutsch}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    "LoGoFoXX 84" ist ein Original vokabular
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - LoGoFoXX 84
    RPA.Desktop.Press Keys    alt    b
    RPA.Windows.Click    name:"Vorgespeicherte Vokabulare"
    RPA.Windows.Click    name:"LoGoFoXX-Programme"
    ${name}=    RPA.Windows.Get Attribute    name:"LoGoFoXX 84 (aktuell)"    Name
    Should Be Equal    ${name}    LoGoFoXX 84 (aktuell)
