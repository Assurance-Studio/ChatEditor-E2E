*** Settings ***
Documentation       Check "LAMP WFL - Français 1-clic" FRANCAISE vocabulary
Resource            ../../../../Resources/resources.robot
Resource            ../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor
Library    Dialogs

*** Test Cases ***
Validate "LAMP WFL - Français 1-clic" vocabulary
    Create new configuration of ChatEditor
    Select Words For Life (Nova Edition)
    Select language    ${english&Français}
    Create user                FrançaisUser
    Maximize the window
    Reach Library of vocabs    b
    Select vocabulary    name:"Canadienne-Française"    name:LAMP    ${lampWFLFrançais1Clic}

Assertions
    # Click on a button's text - LAMP WFL - Français 1-clic
    Set Resolution    ${windowFrançais}   1800    800
    Get Element    name:Aide    timeout=5
    ${text}    Set Variable    little
    Click On Button With Text    ${text}    LAMPwordsForLife\\lampWFLFrancais1Clic\\petit.png    0.6
    ${message}=    RPA.Windows.Get Value    id:1000
    Should Contain    ${message}    Petit

    Check to see if the user exist - FrançaisUser

    # Check to see if the dictionary's name is included in the text box - LAMP WFL - Français 1-clic
    RPA.Windows.Click    ${edit_mode_btn_english&français}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    Le vocabulaire "LAMP WFL – Français 1-clic"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - LAMP WFL - Français 1-clic
    RPA.Desktop.Press Keys    alt    b
    RPA.Windows.Click    name:"Canadienne-Française"
    RPA.Windows.Click    name:LAMP
    ${name}=    RPA.Windows.Get Attribute    name:"LAMP WFL – Français 1-clic (Courant)"    Name
    Should Be Equal    ${name}    LAMP WFL – Français 1-clic (Courant)
