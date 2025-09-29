*** Settings ***
Documentation       Check "Unity 84 Sequenced" ENGLISH vocabulary
Resource            ../../../Resources/resources.robot
Resource            ../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor
Library    Dialogs

*** Test Cases ***
Validate "Unity 84 Sequenced" vocabulary
    Create new configuration of ChatEditor
    Select Unity
    Create user                EnglishUser
    Maximize the window
    Reach Library of vocabs    l
    Select vocabulary          name:English    name:Unity    name:Sequenced    ${unity84Sequenced}

Assertions
    # Click on a button's text - Unity 84 Sequenced
    Set Resolution    ${window}    1800    800
    Get Element    name:Help    timeout=5
    ${text}    Set Variable    ME
    Click On Button With Text    ${text}    Unity\\unity84Sequenced\\me.png    0.6

    Check to see if the user exist

    # Check to see if the dictionary's name is included in the text box - Unity 84 Sequenced
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    The vocabulary "Unity 84 Sequenced"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - Unity 84 Sequenced
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:Unity
    RPA.Windows.Click    name:Sequenced
    ${name}=    RPA.Windows.Get Attribute    name:"Unity 84 Sequenced (Current)"    Name
    Should Be Equal    ${name}    Unity 84 Sequenced (Current)
