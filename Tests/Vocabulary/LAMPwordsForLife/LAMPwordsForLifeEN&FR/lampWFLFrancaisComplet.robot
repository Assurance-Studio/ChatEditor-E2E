*** Settings ***
Documentation       Check "LAMP WFL - Français Complet" FRANCAISE vocabulary
Resource            ../../../../Resources/resources.robot
Resource            ../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor
Library    Dialogs

*** Test Cases ***
Validate "LAMP WFL - Français Complet" vocabulary
    Create new configuration of ChatEditor
    Select Words For Life (Nova Edition)
    Select language    ${english&Français}
    Create user                FrançaisUser
    Maximize the window
    Reach Library of vocabs    b
    Select vocabulary    name:"Canadienne-Française"    name:LAMP    ${lampWFLFrançaisComplet}

Assertions
    # Click on a button's text - LAMP WFL - Français Complet
    Set Resolution    ${windowFrançais}   1800    800
    Get Element    name:Aide    timeout=5
    ${text}    Set Variable    finir
    Click On Button With Text    ${text}    LAMPwordsForLife\\lampWFLFrancaisComplet\\finir.png    0.6

    Check to see if the user exist - FrançaisUser

    # Check to see if the dictionary's name is included in the text box - LAMP WFL - Français Complet
    RPA.Windows.Click    ${edit_mode_btn_english&français}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    Le vocabulaire "LAMP WFL – Français Complet"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - LAMP WFL - Français Complet
    RPA.Desktop.Press Keys    alt    b
    RPA.Windows.Click    name:"Canadienne-Française"
    RPA.Windows.Click    name:LAMP
    ${name}=    RPA.Windows.Get Attribute    name:"LAMP WFL – Français Complet (Courant)"    Name
    Should Be Equal    ${name}    LAMP WFL – Français Complet (Courant)
