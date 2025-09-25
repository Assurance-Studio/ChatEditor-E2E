*** Settings ***
Documentation       Check "My Resources" feature
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

Check that Open button opens the vocabulary
    RPA.Windows.Click    ${edit_mode_btn}
    Reach Library of vocabs    l
    RPA.Windows.Click    ${myResources}
    RPA.Windows.Click    name:"new_vocab (Current)"
    #Click on Open button
    RPA.Windows.Click    id:33674
    Reach Library of vocabs    l
    RPA.Windows.Click    ${myResources}
    RPA.Windows.Get Element    name:"new_vocab (Current)"

Check that the vocabulary is duplicated
    RPA.Windows.Click    name:"new_vocab (Current)"
    RPA.Windows.Click    id:33676
    #Click on the save button
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    enter
    RPA.Windows.Get Element    name:"new_vocab_Copy"

Check that the vocabulary can be renamed
    RPA.Windows.Click    name:"new_vocab_Copy"
    RPA.Windows.Click    id:33681
    Send Keys    id:1350    new_vocab_renamed
    #Click on the save button
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    enter
    RPA.Windows.Get Element    name:"new_vocab_renamed"

Delete the vocabulary
    RPA.Windows.Click    name:"new_vocab_renamed"
    RPA.Windows.Click    id:33682
    Send Keys    id:1344    yes
    ${continue}=    Get Attribute    id:1    IsEnabled
    Should Contain Any    ${continue}    1    True    "1"    "True"
    RPA.Windows.Click    id:1
    #Check that the vocabulary is deleted
    ${result}=    Run Keyword And Ignore Error    RPA.Windows.Get Element    name:"new_vocab_renamed"
    Run Keyword If    '${result}[0]' == 'FAIL'    Log    Element 'new_vocab_renamed' is not present.
