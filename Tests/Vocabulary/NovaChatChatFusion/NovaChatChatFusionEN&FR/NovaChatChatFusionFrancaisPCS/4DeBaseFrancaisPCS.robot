*** Settings ***
Documentation       Check "4 de base français PCS" FRANCAISE vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor
Library    Dialogs

*** Test Cases ***
Validate "4 de base français PCS" vocabulary
    Create new configuration of ChatEditor
    Select Nova Chat
    Select language            ${english&Français}
    Select Symbol Set: PCS
    Create user                FrançaisUser
    Maximize the window
    Reach Library of vocabs    b
    Select vocabulary    name:"Canadienne-Française"    name:PCS     ${4DeBaseFrançaisPCS}

Assertions for "4 de base français PCS" FRANCAISE vocabulary
    # Click on a button's text - 4 de base français PCS
    Set Resolution    ${windowFrançais}    1800    800
    ${text}    Set Variable    Je veux
    Click On Button With Text    ${text}    NovaChatChatFusion\\NovaChatChatFusionEnglish&Francais\\4DeBaseFrancaisPCS\\jeVeux.png    0.6
    ${message}=    RPA.Windows.Get Value    id:1000
    Should Contain    ${message}    Je veux

    Check to see if the user exist - FrançaisUser

    # Check to see if the dictionary's name is included in the text box - 4 de base français PCS
    RPA.Windows.Click    ${edit_mode_btn_english&français}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    Le vocabulaire "4 de base français PCS"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - 4 de base français PCS
    RPA.Desktop.Press Keys    alt    b
    RPA.Windows.Click    name:"Canadienne-Française"
    RPA.Windows.Click    name:PCS
    ${name}=    RPA.Windows.Get Attribute    name:"4 de base français PCS (Courant)"    Name
    Should Be Equal    ${name}    4 de base français PCS (Courant)
