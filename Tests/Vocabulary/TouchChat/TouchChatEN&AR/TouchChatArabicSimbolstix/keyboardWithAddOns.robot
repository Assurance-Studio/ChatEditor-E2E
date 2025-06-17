*** Settings ***
Documentation       Check "Keyboard with Add-ons" ARABIC vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor
Library    Dialogs

*** Test Cases ***
Validate "Keyboard with Add-ons" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select language            ${english&Arabic}
    Select Symbol Set: SymbolStix without aditional vocabularies
    Create user                ArabicUser
    Maximize the window
    Reach Library of vocabs    l
    Select vocabulary    name:Arabic    ${keyboardWithAddOns}

Assertions
    # Click on a button's text - Keyboard with Add-ons
    Set Resolution    ${windowArabic}    1800    800
    Get Element    name:Help    timeout=5
    ${text}    Set Variable    سطر
    Click On Button With Text    ${text}    TouchChat\\TouchChatEnglish&Arabic\\keyboardWithAddOns\\line.png    0.6

    Check to see if the user exist - ArabicUser

    #Check to see if the dictionary's name is included in the text box - Keyboard with Add-ons
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Log    ${message}
    Should Contain    ${message}    The vocabulary "لوحة المفاتيح مع إضافات"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - Keyboard with Add-ons
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:Arabic
    ${name}=    RPA.Windows.Get Attribute    name:"لوحة المفاتيح مع إضافات (Current)"    Name
    Should Be Equal    ${name}    لوحة المفاتيح مع إضافات (Current)
