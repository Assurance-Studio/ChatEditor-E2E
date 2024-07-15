*** Settings ***
Documentation       Check "Essence 60" ENGLISH vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor
Library    Dialogs

*** Test Cases ***
Validate "Essence 60" vocabulary
    Create new configuration of ChatEditor
    Select Dialogue
    Select language            ${english}
    Create user                EnglishUser
    Maximize the window
    Reach Library of vocabs    l
    Select vocabulary          name:English    name:Essence    ${essence60}

Assertions
    # Click on a button's text - Essence 60
    Set Resolution    ${window}    1800    800
    Get Element    name:Help    timeout=5
    ${text}    Set Variable    I need some help
    Click On Button With Text    ${text}    Dialogue\\DialogueEnglish\\essence60\\iNeedSomeHelp.png    0.6
    ${message}=    RPA.Windows.Get Value    id:1000
    Should Contain    ${message}    I need some help.

    Check to see if the user exist

    # Check to see if the dictionary's name is included in the text box - Essence 60
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    The vocabulary "Essence 60"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - Essence 60
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:Essence
    ${name}=    RPA.Windows.Get Attribute    name:"Essence 60 (Current)"    Name
    Should Be Equal    ${name}    Essence 60 (Current)
