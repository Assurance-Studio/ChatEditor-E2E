*** Settings ***
Documentation       Check "ABC 50 Metacom 3.0" DEUTSCH vocabulary

Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot
Library             Dialogs

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor


*** Test Cases ***
Validate "ABC 50 Metacom 3.0" vocabulary
    Create new configuration of ChatEditor
    Select Nova Chat
    Select language    ${english&Deutsch}
    Select Symbol Set: Metacom
    Create user    DeutschUser
    Maximize the window
    Reach Library of vocabs    b
    Select vocabulary    name:"Vorgespeicherte Vokabulare"    name:"ABC-Programme"    ${ABC50Metacom3.0}

Assertions for "ABC 50 Metacom 3.0" DEUTSCH vocabulary
    # Click on a button's text - ABC 50 Metacom    3.0
    Set Resolution    ${windowDeutsch}    1800    800
    Get Element    name:Hilfe    timeout=5
    ${text}=    Set Variable    GROSS
    Click On Button With Text
    ...    ${text}
    ...    NovaChatChatFusion\\NovaChatChatFusionEnglish&Deutsch\\ABC45Metacom_3.0\\gross.png
    ...    0.6

    Check to see if the user exist - DeutschUser

    # Check to see if the dictionary's name is included in the text box - ABC 50 Metacom 3.0
    RPA.Windows.Click    ${edit_mode_btn_english&deutsch}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    "ABC 50 Metacom 3.0" ist ein Original vokabular
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - ABC 50 Metacom 3.0
    RPA.Desktop.Press Keys    alt    b
    RPA.Windows.Click    name:"Vorgespeicherte Vokabulare"
    RPA.Windows.Click    name:"ABC-Programme"
    ${name}=    RPA.Windows.Get Attribute    name:"ABC 50 Metacom 3.0 (aktuell)"    Name
    Should Be Equal    ${name}    ABC 50 Metacom 3.0 (aktuell)
