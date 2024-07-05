*** Settings ***
Documentation       Check "ABC 50 3.0" DEUTSCH vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor
Library    Dialogs

*** Test Cases ***
Validate "ABC 50 3.0" vocabulary
    Create new configuration of ChatEditor
    Select Nova Chat
    Select language            ${english&Deutsch}
    Select Symbol Set: SymbolStix
    Create user                DeutschUser
    Maximize the window
    Reach Library of vocabs    b
    Select vocabulary    name:"Vorgespeicherte Vokabulare"    name:"ABC-Programme"     ${ABC50_3.0}

Assertions for "ABC 50 3.0" DEUTSCH vocabulary
    # Click on a button's text - ABC 50 3.0
    Set Resolution    ${windowDeutsch}    1800    800
    ${text}    Set Variable    THEMEN
    Click On Button With Text    ${text}    NovaChatChatFusion\\NovaChatChatFusionEnglish&Deutsch\\ABC50_3.0\\themen.png    0.6

    Check to see if the user exist - DeutschUser

    # Check to see if the dictionary's name is included in the text box - ABC 50 3.0
    RPA.Windows.Click    ${edit_mode_btn_english&deutsch}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    "ABC 50 3.0" ist ein Original vokabular
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - ABC 50 3.0
    RPA.Desktop.Press Keys    alt    b
    RPA.Windows.Click    name:"Vorgespeicherte Vokabulare"
    RPA.Windows.Click    name:"ABC-Programme"
    ${name}=    RPA.Windows.Get Attribute    name:"ABC 50 3.0 (aktuell)"    Name
    Should Be Equal    ${name}    ABC 50 3.0 (aktuell)
