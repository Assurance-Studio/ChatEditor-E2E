*** Settings ***
Documentation       Check "myQuickChat 8 Kind SS" NEDERLANDS vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor
Library    Dialogs

*** Test Cases ***
Validate "myQuickChat 8 Kind SS" vocabulary
    Create new configuration of ChatEditor
    Select Nova Chat
    Select language            ${english&Nederlands}
    Select Symbol Set: SymbolStix
    Create user                NederlandsUser
    Maximize the window
    Reach Library of vocabs    b
    Select vocabulary    name:Nederlands    name:SymbolStix     ${myQuickChat8KindSS}

Assertions for "myQuickChat 8 Kind SS" ENGLISH vocabulary
    # Click on a button's text - myQuickChat 8 Kind SS
    Set Resolution    ${windowNederlands}    1800    800
    ${text}    Set Variable    Quickchat 1
    Click On Button With Text    ${text}    NovaChatChatFusion\\NovaChatChatFusionEnglish&Nederlands\\myQuickChat8KindSS\\quickchat1.png    0.6

    Check to see if the user exist - NederlandsUser

    # Check to see if the dictionary's name is included in the text box - myQuickChat 8 Kind SS
    RPA.Windows.Click    ${edit_mode_btn_english&nederlands}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    Het vocabulaire "myQuickChat 8 Kind SS"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - myQuickChat 8 Kind SS
    RPA.Desktop.Press Keys    alt    b
    RPA.Windows.Click    name:Nederlands
    RPA.Windows.Click    name:SymbolStix
    ${name}=    RPA.Windows.Get Attribute    name:"myQuickChat 8 Kind SS (Huidig)"    Name
    Should Be Equal    ${name}    myQuickChat 8 Kind SS (Huidig)
