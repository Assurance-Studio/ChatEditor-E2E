*** Settings ***
Documentation       Check "Unity 36 1-Hit" ENGLISH vocabulary
Resource            ../../../Resources/resources.robot
Resource            ../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor
Library    Dialogs

*** Test Cases ***
Validate "Unity 36 1-Hit" vocabulary
    Create new configuration of ChatEditor
    Select Unity
    Create user                EnglishUser
    Maximize the window
    Reach Library of vocabs    l
    Select vocabulary          name:English    name:Unity    name:1-Hit    ${unity36_1-Hit}

Assertions
    # Click on a button's text - Unity 36 1-Hit
    Set Resolution    ${window}    1800    800
    Get Element    name:Help    timeout=5
    ${text}    Set Variable    ME & MY SENTENCES
    Click On Button With Text    ${text}    Unity\\unity36_1-Hit\\me&mySentences.png    0.6

    Check to see if the user exist

    # Check to see if the dictionary's name is included in the text box - Unity 36 1-Hit
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    The vocabulary "Unity 36 1-Hit"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - Unity 36 1-Hit
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:Unity
    RPA.Windows.Click    name:1-Hit
    ${name}=    RPA.Windows.Get Attribute    name:"Unity 36 1-Hit (Current)"    Name
    Should Be Equal    ${name}    Unity 36 1-Hit (Current)
