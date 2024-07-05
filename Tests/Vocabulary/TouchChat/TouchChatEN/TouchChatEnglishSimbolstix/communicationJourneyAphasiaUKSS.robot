*** Settings ***
Documentation       Check "Communication Journey Aphasia UK SS" ENGLISH vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor

*** Test Cases ***
Validate "Communication Journey Aphasia UK SS" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select language            ${english}
    Select Symbol Set: SymbolStix without aditional vocabularies
    Create user                EnglishUser
    Maximize the window
    Reach Library of vocabs    l
    Select vocabulary    name:English    name:SymbolStix    ${communicationJourneyAphasiaUKSS}

Assertions
    # Click on a button's text - Communication Journey Aphasia UK SS
    Set Resolution    ${window}    1800    800
    ${text}    Set Variable    Things
    Click On Button With Text    ${text}    TouchChat\\TouchChatEnglish\\communicationJourneyAphasiaUKSS\\things.png    0.6

    Check to see if the user exist

    # Check to see if the dictionary's name is included in the text box - Communication Journey Aphasia UK SS
    RPA.Windows.Click    ${edit_mode_btn}
    ${message}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${message}    The vocabulary "Communication Journey Aphasia UK SS"
    RPA.Windows.Click    id:7

    # Check to see if the dictionary's 'name' attribute is its actual name - Communication Journey Aphasia UK SS
    RPA.Desktop.Press Keys    alt    l
    RPA.Windows.Click    name:English
    RPA.Windows.Click    name:SymbolStix
    ${name}=    RPA.Windows.Get Attribute    name:"Communication Journey Aphasia UK SS (Current)"    Name
    Should Be Equal    ${name}    Communication Journey Aphasia UK SS (Current)
