*** Settings ***
Documentation       Check "WordPower20 Simply PCS" ENGLISH vocabulary
Resource            ../../../../../../Resources/resources.robot
Resource            ../../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor

*** Test Cases ***
Validate "WordPower20 Simply PCS" vocabulary
    Create new configuration of ChatEditor
    Select Nova Chat
    Select language            ${english}
    Select Symbol Set: SymbolStix&PCS without aditional vocabularies    True
    Create user                EnglishUser
    Maximize the window
    Reach Library of vocabs    l
    Select vocabulary    name:English    name:PCS    name:WordPower     ${wordPower20SimplyPCS}

Assertions for "WordPower20 Simply PCS" ENGLISH vocabulary
    # Click on a button's text - WordPower 20 Simply PCS
    Set Resolution    ${window}    1800    800
    ${text}    Set Variable    clear
    Click On Button With Text    ${text}    NovaChatChatFusion\\NovaChatChatFusionEnglish\\wordPower20SimplyPCS\\clear.png    0.6

    Check to see if the user exist

    # Check to see if the dictionary's name is included in the text box - WordPower 20 Simply PCS
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    The vocabulary "WordPower20 Simply PCS"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - WordPower 20 Simply PCS
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:PCS
    RPA.Windows.Click    name:WordPower
    ${name}=    RPA.Windows.Get Attribute    name:"WordPower20 Simply PCS (Current)"    Name
    Should Be Equal    ${name}    WordPower20 Simply PCS (Current)
