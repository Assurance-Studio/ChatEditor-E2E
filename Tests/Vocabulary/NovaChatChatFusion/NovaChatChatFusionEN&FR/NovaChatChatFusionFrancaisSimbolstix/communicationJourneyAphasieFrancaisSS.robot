*** Settings ***
Documentation       Check "Communication Journey Aphasie français SS" FRANCAISE vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor
Library    Dialogs

*** Test Cases ***
Validate "Communication Journey Aphasie français SS" vocabulary
    Create new configuration of ChatEditor
    Select Nova Chat
    Select language            ${english&Français}
    Select Symbol Set: SymbolStix
    Create user                FrançaisUser
    Maximize the window
    Reach Library of vocabs    b
    Select vocabulary    name:"Canadienne-Française"    name:SymbolStix     ${communicationJourneyAphasiaFrançaisSS}

Assertions for "Communication Journey Aphasie français SS" ENGLISH vocabulary
    # Click on a button's text - Communication Journey Aphasie français SS
    Set Resolution    ${windowFrançais}    1800    800
    ${text}    Set Variable    Objets
    Click On Button With Text    ${text}    NovaChatChatFusion\\NovaChatChatFusionEnglish&Francais\\communicationJourneyAphasieFrancaisSS\\objets.png    0.6

    Check to see if the user exist - FrançaisUser

    # Check to see if the dictionary's name is included in the text box - Communication Journey Aphasie français SS
    RPA.Windows.Click    ${edit_mode_btn_english&français}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    Le vocabulaire "Communication Journey Aphasie français SS"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - Communication Journey Aphasie français SS
    RPA.Desktop.Press Keys    alt    b
    RPA.Windows.Click    name:"Canadienne-Française"
    RPA.Windows.Click    name:SymbolStix
    ${name}=    RPA.Windows.Get Attribute    name:"Communication Journey Aphasie français SS (Courant)"    Name
    Should Be Equal    ${name}    Communication Journey Aphasie français SS (Courant)
