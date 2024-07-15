*** Settings ***
Documentation       Check "Ward Board Without Symbols" HEBREW vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor
Library    Dialogs

*** Test Cases ***
Validate "Ward Board Without Symbols" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select language            ${english&Hebrew}
    Select Symbol Set: SymbolStix without aditional vocabularies
    Create user                HebrewUser
    Maximize the window
    Reach Library of Hebrew vocabs
    Select vocabulary    name:Hebrew    ${wardBoardWithoutSymbols}

Assertions for "Ward Board Without Symbols"
    # Click on a button's text - Ward Board Without Symbols
    Set Resolution    ${windowHebrew}    1800    800
    Get Element    name:עזרה    timeout=5
    ${text}    Set Variable    כואב לי
    Click On Button With Text    ${text}    TouchChat\\TouchChatEnglish&Hebrew\\wardBoardWithoutSymbols\\iAmInPain.png    0.6

    Check to see if the user exist - HebrewUser

    #Check to see if the dictionary's name is included in the text box - Ward Board Without Symbols
    RPA.Windows.Click    ${edit_mode_btn_english&hebrew}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}     לוח התקשורת "לוח אשפוז ללא סמלים" הוא מקורי ולא ניתן לשנותו
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - Ward Board Without Symbols
    Reach Library of Hebrew vocabs
    RPA.Windows.Click    name:Hebrew
    ${name}=    RPA.Windows.Get Attribute    name:"לוח אשפוז ללא סמלים (נוכחי)"    Name
    Should Be Equal    ${name}    לוח אשפוז ללא סמלים (נוכחי)
