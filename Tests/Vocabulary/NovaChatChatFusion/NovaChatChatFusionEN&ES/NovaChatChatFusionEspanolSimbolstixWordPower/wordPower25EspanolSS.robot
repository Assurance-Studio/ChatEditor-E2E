*** Settings ***
Documentation       Check "WordPower25 Español SS" ESPAÑOL vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor
Library    Dialogs

*** Test Cases ***
Validate "WordPower25 Español SS" vocabulary
    Create new configuration of ChatEditor
    Select Nova Chat
    Select language            ${english&Español}
    Select Symbol Set: SymbolStix
    Create user                EspañolUser
    Maximize the window
    Reach Library of vocabs    b
    Select vocabulary    name:"Español de América"    name:SymbolStix    name:WordPower     ${wordPower25EspanolSS}

Assertions for "WordPower25 Español SS" ESPAÑOL vocabulary
    # Click on a button's text - WordPower25 Español SS
    Set Resolution    ${windowEspañol}    1800    800
    Get Element    name:Ayuda    timeout=5
    ${text}    Set Variable    yo
    Click On Button With Text    ${text}    NovaChatChatFusion\\NovaChatChatFusionEnglish&Espanol\\wordPower25EspanolSS\\yo.png    0.6

    Check to see if the user exist - EspañolUser

    # Check to see if the dictionary's name is included in the text box - WordPower25 Español SS
    RPA.Windows.Click    ${edit_mode_btn_english&espanol}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    El vocabulario "WordPower25 Español SS"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - WordPower25 Español SS
    RPA.Desktop.Press Keys    alt    b
    RPA.Windows.Click    name:"Español de América"
    RPA.Windows.Click    name:SymbolStix
    RPA.Windows.Click    name:WordPower
    ${name}=    RPA.Windows.Get Attribute    name:"WordPower25 Español SS(Actual)"    Name
    Should Be Equal    ${name}    WordPower25 Español SS(Actual)
