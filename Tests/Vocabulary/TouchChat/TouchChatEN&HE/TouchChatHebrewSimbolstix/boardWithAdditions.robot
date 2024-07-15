*** Settings ***
Documentation       Check "Board with Additions" HEBREW vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor
Library    Dialogs

*** Test Cases ***
Validate "Board with Additions" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select language            ${english&Hebrew}
    Select Symbol Set: SymbolStix without aditional vocabularies
    Create user                HebrewUser
    Maximize the window
    Reach Library of Hebrew vocabs
    Select vocabulary    name:Hebrew    ${boardWithAdditions}

Assertions for "Board with Additions"
    # Click on a button's text - Board with Additions
    Set Resolution    ${windowHebrew}    1800    800
    Get Element    name:עזרה    timeout=5
    ${text}    Set Variable     DELETE
    Click On Button With Text    ${text}    TouchChat\\TouchChatEnglish&Hebrew\\boardWithAdditions\\delete.png    0.6

    Check to see if the user exist - HebrewUser

    #Check to see if the dictionary's name is included in the text box - Board with Additions
    RPA.Windows.Click    ${edit_mode_btn_english&hebrew}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}     לוח התקשורת "לוח ׳מקלדת׳ עם תוספות" הוא מקורי ולא ניתן לשנותו
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - Board with Additions
    Reach Library of Hebrew vocabs
    RPA.Windows.Click    name:Hebrew
    ${name}=    RPA.Windows.Get Attribute    name:"לוח ׳מקלדת׳ עם תוספות (נוכחי)"    Name
    Should Be Equal    ${name}  לוח ׳מקלדת׳ עם תוספות (נוכחי)
