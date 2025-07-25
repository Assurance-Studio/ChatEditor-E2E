*** Settings ***
Documentation       Check "LAMP WFL - English Transition" ENGLISH vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor

*** Test Cases ***
Validate "LAMP WFL - English Transition" vocabulary
    Create new configuration of ChatEditor
    Select Words For Life (Nova Edition)
    Create user                EnglishUser
    Maximize the window
    Reach Library of vocabs    l
    Select vocabulary    name:English    name:LAMP    ${lampWFLEnglishTransition}

Assertions
    # Click on a button's text - LAMP WFL - English Transition
    Set Resolution    ${window}    1800    800
    Get Element    name:Help    timeout=5
    ${text}    Set Variable    little
    Click On Button With Text    ${text}    WordsForLife\\lamp84Transition\\little.png    0.6

    Check to see if the user exist

    # Check to see if the dictionary's name is included in the text box - LAMP WFL - English Transition
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    The vocabulary "LAMP WFL - English Transition"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - LAMP WFL - English Transition
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:LAMP
    ${name}=    RPA.Windows.Get Attribute    name:"LAMP WFL - English Transition (Current)"    Name
    Should Be Equal    ${name}    LAMP WFL - English Transition (Current)
