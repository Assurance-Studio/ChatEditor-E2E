*** Settings ***
Documentation       Check "New Vocab", "Backup" and "Restore" features
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
    Select vocabulary    name:English    name:SymbolStix    NONE    ${4BasicSS}

Reach "New Vocab" modal
    Reach Library of vocabs    l
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    enter
    ${text}=    RPA.Windows.Get Text    id:1507
    Should Be Equal    ${text}    A Vocabulary File consists of multiple Pages. A User has only one Vocabulary File in almost all cases. If you want to add a Page, go into Edit and then Create New Page. Press Continue to create a New Vocab File or Cancel to exit.

Create a new vocab
    RPA.Windows.Click    ${ok_btn_id1}
    # See if Cancel button is work
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    right
    RPA.Desktop.Press Keys    enter
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    enter
    RPA.Windows.Click    ${ok_btn_id1}
    # Continue with creating the vocab
    Send Keys    id:1034    new_vocab  #give a new name to the vocab
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    enter
    RPA.Windows.Get Element    name:Page

Create a new page
    Send Keys    id:1034    new_page  #give a new name to the page
    # Adjut the rows
    RPA.Windows.Click    id:1033
    RPA.Windows.Click    name:7
    # Adjut the columns
    RPA.Windows.Click    id:1032
    RPA.Windows.Click    name:11
    ${rows}=    RPA.Windows.Get Value       id:1033
    ${columns}=    RPA.Windows.Get Value    id:1032
    Should Be Equal As Integers    ${rows}        7
    Should Be Equal As Integers    ${columns}    11
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    enter

Assert that the vocab and the page were created
    # Assert that the page was created
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    right
    RPA.Desktop.Press Keys    right
    RPA.Desktop.Press Keys    enter
    RPA.Windows.Get Element    name:"Properties for Page\u003A new_page"  # \u003A is Unicode for ":" because RobotFramework doesn't find the locator
    RPA.Windows.Click    name:Close
    # Assert that the vocab was created
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    right
    RPA.Desktop.Press Keys    right
    RPA.Desktop.Press Keys    right
    RPA.Desktop.Press Keys    enter
    RPA.Windows.Get Element    name:"Properties for Vocab\u003A new_vocab"  # \u003A is Unicode for ":" because RobotFramework doesn't find the locator
    RPA.Windows.Click    name:Close

Reach "Backup" modal
    RPA.Windows.Click    ${edit_mode_btn}
    Reach Library of vocabs    l
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    right
    RPA.Desktop.Press Keys    enter
    ${text}=    RPA.Windows.Get Text    id:1339
    Should Be Equal    ${text}    Are you sure you want to Backup your Library now? This process replaces your current backed up Library with the Library you are currently using.

Create the Backup
    # Confirm that the "Cancel" takes out of the backup
    RPA.Windows.Click    ${ok_btn_id2}
    RPA.Windows.Get Element    name:"Resource Browser - Library"
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    right
    RPA.Desktop.Press Keys    enter
    # Confirm that the "Continue buton is disabled before type "yes"
    ${continue_button}=    Get Attribute    id:1    IsEnabled
    Should Be Equal    ${continue_button}    0
    Send Keys    id:1344    yes
    # Confirm that the "Continue buton is enabled after type "yes"
    ${continue_button}=    Get Attribute    id:1    IsEnabled
    Should Be Equal    ${continue_button}    1
    RPA.Windows.Click    ${ok_btn_id1}

Assert that the backup of libraries was successful
    ${text}=    RPA.Windows.Get Text    id:65535
    Should Be Equal    ${text}    Backup of Libraries was successful.
    RPA.Windows.Click    ${ok_btn_id2}
    RPA.Windows.Get Element    name:"Resource Browser - Library"
    RPA.Windows.Click    name:Close

Reach "Restore" modal
    Reach Library of vocabs    l
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    right
    RPA.Desktop.Press Keys    right
    RPA.Desktop.Press Keys    enter
    ${text}=    RPA.Windows.Get Text    id:1339
    Should Be Equal    ${text}    Are you sure you want to Restore from backup now? This process erases your current Library and replaces it with your most recent backup.

Create the Restore
    # Confirm that the "Cancel" takes out of the backup
    RPA.Windows.Click    ${ok_btn_id2}
    RPA.Windows.Get Element    name:"Resource Browser - Library"
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    right
    RPA.Desktop.Press Keys    right
    RPA.Desktop.Press Keys    enter
    # Confirm that the "Continue" buton is disabled before type "yes"
    ${continue_button}=    Get Attribute    id:1    IsEnabled
    Should Be Equal    ${continue_button}    0
    Send Keys    id:1344    yes
    # Confirm that the "Continue" buton is enabled after type "yes"
    ${continue_button}=    Get Attribute    id:1    IsEnabled
    Should Be Equal    ${continue_button}    1
    RPA.Windows.Click    ${ok_btn_id1}

Assert that the restore of libraries was successful
    ${text}=    RPA.Windows.Get Text    id:65535
    Should Be Equal    ${text}    Restoring Libraries was successful.
    RPA.Windows.Click    ${ok_btn_id2}
    RPA.Windows.Get Element    name:"Resource Browser - Library"
