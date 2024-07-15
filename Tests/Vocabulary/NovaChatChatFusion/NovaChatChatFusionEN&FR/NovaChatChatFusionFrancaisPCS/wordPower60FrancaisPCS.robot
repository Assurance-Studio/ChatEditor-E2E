*** Settings ***
Documentation       Check "WordPower60 français PCS" FRANCAISE vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor
Library    Dialogs

*** Test Cases ***
Validate "WordPower60 français PCS" vocabulary
    Create new configuration of ChatEditor
    Select Nova Chat
    Select language            ${english&Français}
    Select Symbol Set: PCS
    Create user                FrançaisUser
    Maximize the window
    Reach Library of vocabs    b
    Select vocabulary    name:"Canadienne-Française"    name:PCS     ${wordPower60FrançaisPCS}

Assertions for "WordPower60 français PCS" FRANCAISE vocabulary
    # Click on a button's text - WordPower60 français PCS
    Set Resolution    ${windowFrançais}    1800    800
    Get Element    name:Aide    timeout=5
    ${text}    Set Variable    GENS
    Click On Button With Text    ${text}    NovaChatChatFusion\\NovaChatChatFusionEnglish&Francais\\wordPower60FrancaisPCS\\gens.png    0.6

    Check to see if the user exist - FrançaisUser

    # Check to see if the dictionary's name is included in the text box - WordPower60 français PCS
    RPA.Windows.Click    ${edit_mode_btn_english&français}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    Le vocabulaire "WordPower60 français PCS"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - WordPower60 français PCS
    RPA.Desktop.Press Keys    alt    b
    RPA.Windows.Click    name:"Canadienne-Française"
    RPA.Windows.Click    name:PCS
    ${name}=    RPA.Windows.Get Attribute    name:"WordPower60 français PCS (Courant)"    Name
    Should Be Equal    ${name}    WordPower60 français PCS (Courant)
