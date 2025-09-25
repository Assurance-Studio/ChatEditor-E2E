*** Settings ***
Documentation       Check "LAMP WFL - English 1-Hit" ENGLISH vocabulary
Resource            ../../../../Resources/resources.robot
Resource            ../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor

*** Test Cases ***
Validate "LAMP WFL - English 1-Hit" vocabulary
    Create new configuration of ChatEditor
    Select Words For Life (Nova Edition)
    Select language    ${english}
    Create user                EnglishUser
    Maximize the window
    Reach Library of vocabs    l
    Select vocabulary    name:English    name:LAMP    ${lampWFLEnglish1Hit}

Assertions
    # Click on a button's text - LAMP WFL - English 1-Hit
    Set Resolution    ${window}    1800    800
    Get Element    name:Help    timeout=5
    ${text}    Set Variable    little
    Click On Button With Text    ${text}    LAMPwordsForLife\\lampWFLEnglish1Hit\\little.png    0.6
    ${message}=    RPA.Windows.Get Value    id:1000
    Should Contain    ${message}    Little

    Check to see if the user exist

    # Check to see if the dictionary's name is included in the text box - LAMP WFL - English 1-Hit
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    The vocabulary "LAMP WFL - English 1-Hit"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - LAMP WFL - English 1-Hit
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:LAMP
    ${name}=    RPA.Windows.Get Attribute    name:"LAMP WFL - English 1-Hit (Current)"    Name
    Should Be Equal    ${name}    LAMP WFL - English 1-Hit (Current)
