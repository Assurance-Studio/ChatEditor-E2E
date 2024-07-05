*** Settings ***
Documentation       Check "Adult Panel 20" ARABIC vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor
Library    Dialogs

*** Test Cases ***
Validate "Adult Panel 20" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select language            ${english&Arabic}
    Select Symbol Set: SymbolStix without aditional vocabularies
    Create user                ArabicUser
    Maximize the window
    Reach Library of vocabs    l
    Select vocabulary    name:Arabic    ${adultPanel20}

Assertions
    # Click on a button's text - Adult Panel 20
    Set Resolution    ${windowArabic}    1800    800
    ${text}    Set Variable    أنا أشعر
    Click On Button With Text    ${text}    TouchChat\\TouchChatEnglish&Arabic\\adultBoard20\\iFeel.png    0.6

    Check to see if the user exist - ArabicUser

    #Check to see if the dictionary's name is included in the text box - Adult Panel 20
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Log    ${message}
    Should Contain    ${message}    The vocabulary "لوحة البالغين 20"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - Adult Panel 20
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:Arabic
    ${name}=    RPA.Windows.Get Attribute    name:"لوحة البالغين 20 (Current)"    Name
    Should Be Equal    ${name}    لوحة البالغين 20 (Current)
