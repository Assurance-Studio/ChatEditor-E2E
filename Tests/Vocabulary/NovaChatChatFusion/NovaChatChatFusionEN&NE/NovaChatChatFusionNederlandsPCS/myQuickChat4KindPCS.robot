*** Settings ***
Documentation       Check "myQuickChat 4 Kind PCS" NEDERLANDS vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor
Library    Dialogs

*** Test Cases ***
Validate "myQuickChat 4 Kind PCS" vocabulary
    Create new configuration of ChatEditor
    Select Nova Chat
    Select language            ${english&Nederlands}
    Select Symbol Set: PCS
    Create user                NederlandsUser
    Maximize the window
    Reach Library of vocabs    b
    Select vocabulary    name:Nederlands    name:PCS     ${myQuickChat4KindPCS}

Assertions for "myQuickChat 4 Kind PCS" ENGLISH vocabulary
    # Click on a button's text - myQuickChat 4 Kind PCS
    Set Resolution    ${windowNederlands}    1800    800
    Get Element    name:Help    timeout=5
    ${text}    Set Variable    Quickchat 1
    Click On Button With Text    ${text}    NovaChatChatFusion\\NovaChatChatFusionEnglish&Nederlands\\myQuickChat4KindPCS\\quickchat1.png    0.6

    Check to see if the user exist - NederlandsUser

    # Check to see if the dictionary's name is included in the text box - myQuickChat 4 Kind PCS
    RPA.Windows.Click    ${edit_mode_btn_english&nederlands}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    Het vocabulaire "myQuickChat 4 Kind PCS"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - myQuickChat 4 Kind PCS
    RPA.Desktop.Press Keys    alt    b
    RPA.Windows.Click    name:Nederlands
    RPA.Windows.Click    name:PCS
    ${name}=    RPA.Windows.Get Attribute    name:"myQuickChat 4 Kind PCS (Huidig)"    Name
    Should Be Equal    ${name}    myQuickChat 4 Kind PCS (Huidig)
