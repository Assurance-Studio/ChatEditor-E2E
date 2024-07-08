*** Settings ***
Documentation       Check "Communication Journey Aphasie français PCS" FRANCAISE vocabulary

Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot
Library             Dialogs

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor


*** Test Cases ***
Validate "Communication Journey Aphasie français PCS" vocabulary
    Create new configuration of ChatEditor
    Select Nova Chat
    Select language    ${english&Français}
    Select Symbol Set: PCS
    Create user    FrançaisUser
    Maximize the window
    Reach Library of vocabs    b
    Select vocabulary    name:"Canadienne-Française"    name:PCS    ${communicationJourneyAphasiaFrançaisPCS}

Assertions for "Communication Journey Aphasie français PCS" ENGLISH vocabulary
    # Click on a button's text - Communication Journey Aphasie français PCS
    Set Resolution    ${windowFrançais}    1800    800
    # Pause Execution
    ${text}=    Set Variable    Objets
    Click On Button With Text
    ...    ${text}
    ...    NovaChatChatFusion\\NovaChatChatFusionEnglish&Francais\\communicationJourneyAphasieFrancaisPCS\\objets.png
    ...    0.6

    Check to see if the user exist - FrançaisUser

    # Check to see if the dictionary's name is included in the text box - Communication Journey Aphasie français PCS
    RPA.Windows.Click    ${edit_mode_btn_english&français}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    Le vocabulaire "Communication Journey Aphasie français PCS"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - Communication Journey Aphasie français PCS
    RPA.Desktop.Press Keys    alt    b
    RPA.Windows.Click    name:"Canadienne-Française"
    RPA.Windows.Click    name:PCS
    ${name}=    RPA.Windows.Get Attribute    name:"Communication Journey Aphasie français PCS (Courant)"    Name
    Should Be Equal    ${name}    Communication Journey Aphasie français PCS (Courant)
