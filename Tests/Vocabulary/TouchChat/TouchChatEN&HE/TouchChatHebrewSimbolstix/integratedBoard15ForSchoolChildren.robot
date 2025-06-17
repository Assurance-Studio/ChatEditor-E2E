*** Settings ***
Documentation       Check "Integrated Board 15 for School Children" HEBREW vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor
Library    Dialogs

*** Test Cases ***
Validate "Integrated Board 15 for School Children" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select language            ${english&Hebrew}
    Select Symbol Set: SymbolStix without aditional vocabularies
    Create user                HebrewUser
    Maximize the window
    Reach Library of Hebrew vocabs
    Select vocabulary    name:Hebrew    ${integratedBoard15ForSchoolChildren}

Assertions for "Integrated Board 15 for School Children"
    # Click on a button's text - Integrated Board 15 for School Children
    Set Resolution    ${windowHebrew}    1800    800
    Get Element    name:עזרה    timeout=5
    ${text}    Set Variable    מחק
    Click On Button With Text    ${text}    TouchChat\\TouchChatEnglish&Hebrew\\integratedBoard15ForSchoolChildren\\delete.png    0.6

    Check to see if the user exist - HebrewUser

    #Check to see if the dictionary's name is included in the text box - Integrated Board 15 for School Children
    RPA.Windows.Click    ${edit_mode_btn_english&hebrew}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}     לוח התקשורת "לוח 15 משולב לילדי בית ספר" הוא מקורי ולא ניתן לשנותו
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - Integrated Board 15 for School Children
    Reach Library of Hebrew vocabs
    RPA.Windows.Click    name:Hebrew
    ${name}=    RPA.Windows.Get Attribute    name:"לוח 15 משולב לילדי בית ספר (נוכחי)"    Name
    Should Be Equal    ${name}     לוח 15 משולב לילדי בית ספר (נוכחי)
