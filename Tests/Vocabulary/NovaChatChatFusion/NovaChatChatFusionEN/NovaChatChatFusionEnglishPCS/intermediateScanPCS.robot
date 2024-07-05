*** Settings ***
Documentation       Check "Intermediate Scan PCS" ENGLISH vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor

*** Test Cases ***
Validate "Intermediate Scan PCS" vocabulary
    Create new configuration of ChatEditor
    Select Nova Chat
    Select language            ${english}
    Select Symbol Set: SymbolStix&PCS without aditional vocabularies    True
    Create user                EnglishUser
    Maximize the window
    Reach Library of vocabs    l
    Select vocabulary    name:English    name:PCS    ${intermediateScanPCS}

Assertions for "Intermediate Scan PCS" ENGLISH vocabulary
    # Click on a button's text - Intermediate Scan PCS
    Set Resolution    ${window}    1800    800
    ${text}    Set Variable    need
    Click On Button With Text    ${text}    NovaChatChatFusion\\NovaChatChatFusionEnglish\\intermediateScanPCS\\need.png    0.6
    ${message}=    RPA.Windows.Get Value    id:1000
    Should Contain    ${message}    I need

    Check to see if the user exist

    # Check to see if the dictionary's name is included in the text box - Intermediate Scan PCS
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    The vocabulary "Intermediate Scan PCS"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - Intermediate Scan PCS
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:PCS
    ${name}=    RPA.Windows.Get Attribute    name:"Intermediate Scan PCS (Current)"    Name
    Should Be Equal    ${name}    Intermediate Scan PCS (Current)
