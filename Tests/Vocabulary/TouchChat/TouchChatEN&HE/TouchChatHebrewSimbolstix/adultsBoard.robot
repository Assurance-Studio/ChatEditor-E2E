*** Settings ***
Documentation       Check "Adults Board" HEBREW vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor
Library    Dialogs

*** Test Cases ***
Validate "Adults Board" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select language            ${english&Hebrew}
    Select Symbol Set: SymbolStix without aditional vocabularies
    Create user                HebrewUser
    Maximize the window
    Reach Library of Hebrew vocabs
    Select vocabulary    name:Hebrew    ${adultsBoard}

Assertions for "Adults Board"
    # Click on a button's text - Adults Board
    Set Resolution    ${windowHebrew}    1800    800
    Get Element    name:עזרה    timeout=5
    ${text}    Set Variable     אני מרגיש
    Click On Button With Text    ${text}    TouchChat\\TouchChatEnglish&Hebrew\\adultsBoard\\iFeel.png    0.6

    Check to see if the user exist - HebrewUser

    #Check to see if the dictionary's name is included in the text box - Adults Board
    RPA.Windows.Click    ${edit_mode_btn_english&hebrew}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}     לוח התקשורת "לוח מבוגרים" הוא מקורי ולא ניתן לשנותו
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - Adults Board
    Reach Library of Hebrew vocabs
    RPA.Windows.Click    name:Hebrew
    ${name}=    RPA.Windows.Get Attribute    name:"לוח מבוגרים (נוכחי)"    Name
    Should Be Equal    ${name}  לוח מבוגרים (נוכחי)
