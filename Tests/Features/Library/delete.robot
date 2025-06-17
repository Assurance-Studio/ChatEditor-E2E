*** Settings ***
Documentation       Check "Delete" feature
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

Reach "Delete Multiple Vocabularies" modal
    RPA.Windows.Click    ${edit_mode_btn}
    Reach Library of vocabs    l
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    right
    RPA.Desktop.Press Keys    right
    RPA.Desktop.Press Keys    right
    RPA.Desktop.Press Keys    enter
    ${list}    RPA.Windows.Get Elements    id:1031
    Log    ${list}
    RPA.Windows.Get Element    name:"Delete Multiple Vocabularies"

Delete the custom vocab
    RPA.Windows.Click    name:"new_vocab (Current)"
    RPA.Desktop.Press Keys    space
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    enter
    ${text}=    RPA.Windows.Get Text    id:65535
    Should Be Equal    ${text}    Are you sure you want to delete the selected item(s)?
    RPA.Windows.Click    id:7
    # Confirm that the "Cancel" takes out of the Delete modal
    RPA.Windows.Click    name:"new_vocab (Current)"
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    right
    RPA.Desktop.Press Keys    enter
    RPA.Windows.Get Element    name:"Resource Browser - Library"
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    right
    RPA.Desktop.Press Keys    right
    RPA.Desktop.Press Keys    right
    RPA.Desktop.Press Keys    enter
    RPA.Windows.Click    name:"new_vocab (Current)"
    RPA.Desktop.Press Keys    space
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    enter
    RPA.Windows.Click    id:6

Confirm that the custom vocabulary was deleted
    RPA.Windows.Click    name:"Resource Browser - Library"
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    right
    RPA.Desktop.Press Keys    right
    RPA.Desktop.Press Keys    right
    RPA.Desktop.Press Keys    enter
    ${exists}=    Run Keyword And Return Status    Get Element    name:"new_vocab (Current)"
    IF    $exists
        Fail
    ELSE
        Log    The vocabulary was deleted
    END
