*** Settings ***
Documentation       Check "Engage" ENGLISH vocabulary
Resource            ../../../../Resources/resources.robot
Resource            ../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor
Library    Dialogs

*** Test Cases ***
Validate "Engage" vocabulary
    Create new configuration of ChatEditor
    Select Words For Life (Nova Edition)
    Select language            ${english}
    Create user                EnglishUser
    Maximize the window
    Reach Library of vocabs    l
    Select vocabulary    name:English    name:LAMP    ${engage}

Assertions
    # Click on a button's text - Engage
    Set Resolution    ${window}    1800    800
    Get Element    name:Help    timeout=5
    ${text}    Set Variable    PRACTICE
    Click On Button With Text    ${text}    LAMPwordsForLife\\engage\\practice.png    0.6

    Check to see if the user exist

    # Check to see if the dictionary's name is included in the text box - Engage
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    The vocabulary "Engage"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - Engage
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:LAMP
    ${name}=    RPA.Windows.Get Attribute    name:"Engage (Current)"    Name
    Should Be Equal    ${name}    Engage (Current)
