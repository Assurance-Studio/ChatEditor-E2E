*** Settings ***
Documentation       Check "LAMP WFL - English Full" ENGLISH vocabulary
Resource            ../../../../Resources/resources.robot
Resource            ../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor

*** Test Cases ***
Validate "LAMP WFL - English Full" vocabulary
    Create new configuration of ChatEditor
    Select Words For Life (Nova Edition)
    Select language    ${english}
    Create user                EnglishUser
    Maximize the window
    Reach Library of vocabs    l
    Select vocabulary    name:English    name:LAMP    ${lampWFLEnglishFull}

Assertions
    # Click on a button's text - LAMP WFL - English Full
    Set Resolution    ${window}    1800    800
    Get Element    name:Help    timeout=5
    ${text}    Set Variable    finished
    Click On Button With Text    ${text}    LAMPwordsForLife\\lampWFLEnglishFull\\finished.png    0.6

    Check to see if the user exist

    # Check to see if the dictionary's name is included in the text box - LAMP WFL - English Full
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    The vocabulary "LAMP WFL - English Full"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - LAMP WFL - English Full
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:LAMP
    ${name}=    RPA.Windows.Get Attribute    name:"LAMP WFL - English Full (Current)"    Name
    Should Be Equal    ${name}    LAMP WFL - English Full (Current)
