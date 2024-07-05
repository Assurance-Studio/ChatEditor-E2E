*** Settings ***
Documentation       Check "VocabPC français SS" FRANCAISE vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor
Library    Dialogs

*** Test Cases ***
Validate "VocabPC français SS" vocabulary
    Create new configuration of ChatEditor
    Select Nova Chat
    Select language            ${english&Français}
    Select Symbol Set: SymbolStix
    Create user                FrançaisUser
    Maximize the window
    Reach Library of vocabs    b
    Select vocabulary    name:"Canadienne-Française"    name:SymbolStix     ${vocabPCFrançaisSS}

Assertions for "VocabPC français SS" FRANCAISE vocabulary
    # Click on a button's text - VocabPC français SS
    Set Resolution    ${windowFrançais}    1800    800
    ${text}    Set Variable    Je veux
    Click On Button With Text    ${text}    NovaChatChatFusion\\NovaChatChatFusionEnglish&Francais\\vocabPCFrancaisSS\\jeVeux.png    0.6
    ${message}=    RPA.Windows.Get Value    id:1000
    Should Contain    ${message}    Je veux

    Check to see if the user exist - FrançaisUser

    # Check to see if the dictionary's name is included in the text box - VocabPC français SS
    RPA.Windows.Click    ${edit_mode_btn_english&français}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    Le vocabulaire "VocabPC français SS"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - VocabPC français SS
    RPA.Desktop.Press Keys    alt    b
    RPA.Windows.Click    name:"Canadienne-Française"
    RPA.Windows.Click    name:SymbolStix
    ${name}=    RPA.Windows.Get Attribute    name:"VocabPC français SS (Courant)"    Name
    Should Be Equal    ${name}    VocabPC français SS (Courant)
