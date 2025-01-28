*** Settings ***
Documentation       Check "Check Online For New Version" feature
Resource            ../../../Resources/resources.robot
Resource            ../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor

Library    Dialogs

*** Test Cases ***
Reach "4-Basic SS" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select language            ${english}
    Select Symbol Set: SymbolStix without aditional vocabularies
    Create user                EnglishUser
    Maximize the window
    Reach Library of vocabs    l
    Select vocabulary    name:English    name:SymbolStix    ${4BasicSS}

Reach "Check Online For New Version" modal
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    h
    # Click the Check Online For New Version button
    RPA.Windows.Click    id:33695
    ${update}=    RPA.Windows.Get Text    id:65535
    IF    "A new version of ChatEditor is available online." in $update
        RPA.Windows.Click    name:No
    ELSE IF    "No new version is currently available for ChatEditor." in $update
        RPA.Windows.Click    ${ok_btn_id2}
    END
    # Assert this by accessing "Library" section(if the "About" box is opened, you are not able to open the "Library" section)
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    l
    RPA.Windows.Get Element    name:"Resource Browser - Library"
