*** Settings ***
Documentation       Check "Épeler français PCS" FRANCAISE vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor
Library    Dialogs

*** Test Cases ***
Validate "Épeler français PCS" vocabulary
    Create new configuration of ChatEditor
    Select Nova Chat
    Select language            ${english&Français}
    Select Symbol Set: PCS
    Create user                FrançaisUser
    Maximize the window
    Reach Library of vocabs    b
    Select vocabulary    name:"Canadienne-Française"    name:PCS     ${epelerFrancaisPCS}

Assertions for "Épeler français PCS" FRANCAISE vocabulary
    # Click on a button's text - Épeler français SS
    Set Resolution    ${windowFrançais}    1800    800
    Get Element    name:Aide    timeout=5
    ${text}    Set Variable    PHRASES
    Click On Button With Text    ${text}    NovaChatChatFusion\\NovaChatChatFusionEnglish&Francais\\epelerFrancaisPCS\\phrases.png    0.6

    Check to see if the user exist - FrançaisUser

    # Check to see if the dictionary's name is included in the text box - Épeler français PCS
    RPA.Windows.Click    ${edit_mode_btn_english&français}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    Le vocabulaire "Épeler français PCS"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - Épeler français PCS
    RPA.Desktop.Press Keys    alt    b
    RPA.Windows.Click    name:"Canadienne-Française"
    RPA.Windows.Click    name:PCS
    ${name}=    RPA.Windows.Get Attribute    name:"Épeler français PCS (Courant)"    Name
    Should Be Equal    ${name}    Épeler français PCS (Courant)
