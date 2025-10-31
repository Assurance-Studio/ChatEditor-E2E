*** Settings ***
Documentation       Check "Engage PCS" ENGLISH vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor

*** Test Cases ***
Validate "Engage PCS" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select language            ${english}
    Select Symbol Set: SymbolStix&PCS without aditional vocabularies
    Create user                EnglishUser
    Maximize the window
    Reach Library of vocabs    l
    Select vocabulary    name:English    name:PCS    name:ToolBox     ${engagePCS}

Assertions
    # Click on a button's text - Engage PCS
    Set Resolution    ${window}    1800    800
    Get Element    name:Help    timeout=5
    ${text}    Set Variable    PRACTICE
    Click On Button With Text    ${text}    TouchChat\\TouchChatEnglish\\engageForIOSPCS\\practice.png    0.6

    Check to see if the user exist

    # Check to see if the dictionary's name is included in the text box - Engage PCS
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    The vocabulary "Engage PCS"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - Engage PCS
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:PCS
    RPA.Windows.Click    name:ToolBox
    ${name}=    RPA.Windows.Get Attribute    name:"Engage PCS (Current)"    Name
    Should Be Equal    ${name}    Engage PCS (Current)
