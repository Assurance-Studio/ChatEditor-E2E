*** Settings ***
Documentation       Check "RehaFoXX 1.02" DEUTSCH vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor
Library    Dialogs

*** Test Cases ***
Validate "RehaFoXX 1.02" vocabulary
    Create new configuration of ChatEditor
    Select Nova Chat
    Select language            ${english&Deutsch}
    Select Symbol Set: Metacom
    Create user                DeutschUser
    Maximize the window
    Reach Library of vocabs    b
    Select vocabulary    name:"Vorgespeicherte Vokabulare"    name:"RehaFoXX-Programme"     ${rehaFoXX1.02}

Assertions for "RehaFoXX 1.02" DEUTSCH vocabulary
    # Click on a button's text - RehaFoXX 1.02
    Set Resolution    ${windowDeutsch}    1800    800
    ${text}    Set Variable    ich
    Click On Button With Text    ${text}    NovaChatChatFusion\\NovaChatChatFusionEnglish&Deutsch\\rehaFoXX1.02\\ich.png    0.6

    Check to see if the user exist - DeutschUser

    # Check to see if the dictionary's name is included in the text box - RehaFoXX 1.02
    RPA.Windows.Click    ${edit_mode_btn_english&deutsch}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    "RehaFoXX 1.02" ist ein Original vokabular
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - RehaFoXX 1.02
    RPA.Desktop.Press Keys    alt    b
    RPA.Windows.Click    name:"Vorgespeicherte Vokabulare"
    RPA.Windows.Click    name:"RehaFoXX-Programme"
    ${name}=    RPA.Windows.Get Attribute    name:"RehaFoXX 1.02 (aktuell)"    Name
    Should Be Equal    ${name}    RehaFoXX 1.02 (aktuell)
