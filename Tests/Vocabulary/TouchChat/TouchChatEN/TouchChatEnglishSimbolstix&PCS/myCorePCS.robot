*** Settings ***
Documentation       Check "myCore PCS" ENGLISH vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor

*** Test Cases ***
Validate "myCore PCS" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select language            ${english}
    Select Symbol Set: SymbolStix&PCS without aditional vocabularies
    Create user                EnglishUser
    Maximize the window
    Reach Library of vocabs    l
    Select vocabulary    name:English    name:PCS    NONE    ${myCorePCS}

Assertions
    Check to see if the user exist

    # Check to see if the dictionary's name is included in the text box - myCore PCS
    Set Resolution    ${window}    1800    800
    Get Element    name:Help    timeout=5
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    The vocabulary "myCore PCS"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - myCore PCS
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:PCS
    RPA.Windows.Click    id:DownPageButton
    ${name}=    RPA.Windows.Get Attribute    name:"myCore PCS (Current)"    Name
    Should Be Equal    ${name}    myCore PCS (Current)
