*** Settings ***
Documentation       Check "Board 9 For Children or Teenagers" HEBREW vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor
Library    Dialogs

*** Test Cases ***
Validate "Board 9 For Children or Teenagers" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select language            ${english&Hebrew}
    Select Symbol Set: SymbolStix without aditional vocabularies
    Create user                HebrewUser
    Maximize the window
    Reach Library of Hebrew vocabs
    Select vocabulary    name:Hebrew    ${board9ForChildrenOrTeenagers}

Assertions for "Board 9 For Children or Teenagers"
    # Click on a button's text - Board 9 For Children or Teenagers
    Get Element    name:עזרה    timeout=5
    Set Resolution    ${windowHebrew}    1800    800
    ${text}    Set Variable    לשוחח
    Click On Button With Text    ${text}    TouchChat\\TouchChatEnglish&Hebrew\\board9ForChildrenOrTeenagers\\chatting.png    0.6

    Check to see if the user exist - HebrewUser

    #Check to see if the dictionary's name is included in the text box - Board 9 For Children or Teenagers
    RPA.Windows.Click    ${edit_mode_btn_english&hebrew}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    "לוח 9 לילדים או מתבגרים"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - Board 9 For Children or Teenagers
    Reach Library of Hebrew vocabs
    RPA.Windows.Click    name:Hebrew
    ${name}=    RPA.Windows.Get Attribute    name:" לוח 9 לילדים או מתבגרים (נוכחי)"    Name
    Should Be Equal    ${name}    לוח 9 לילדים או מתבגרים (נוכחי)
