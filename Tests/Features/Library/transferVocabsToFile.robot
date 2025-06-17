*** Settings ***
Documentation       Check "Transfer - Vocabs To File" feature
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

Reach "Transfer Vocabs To File" modal
    RPA.Windows.Click    name:"Resource Browser - Library"
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    right
    RPA.Desktop.Press Keys    right
    RPA.Desktop.Press Keys    right
    RPA.Desktop.Press Keys    right
    RPA.Desktop.Press Keys    enter
    RPA.Windows.Click    id:33691
    RPA.Windows.Get Element    name:"Transfer Vocabs To File"

Transfer the vocab to file
    RPA.Windows.Click    name:"new_vocab (Current)"
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    enter
    #Set the path where we want the vocabulary to be saved
    RPA.Windows.Right Click    id:41477
    RPA.windows.Click    id:1280
    Send Keys    id:41477    ${transferVocabsToFilePath}
    #Transfer the vocab
    RPA.windows.Click    ${ok_btn_id1}
    RPA.Windows.Get Element    name:"Resource Browser - Library"    timeout=15

Assert that the vocab was correctly transferred
    RPA.Windows.Click    name:"Resource Browser - Library"
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    right
    RPA.Desktop.Press Keys    right
    RPA.Desktop.Press Keys    right
    RPA.Desktop.Press Keys    right
    RPA.Desktop.Press Keys    enter
    RPA.Windows.Click    id:33691
    RPA.Windows.Click    name:"new_vocab (Current)"
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    enter
    #Set the path where we want the vocabulary to be saved
    RPA.Windows.Right Click    id:41477
    RPA.windows.Click    id:1280
    Send Keys    id:41477    ${transferVocabsToFilePath}
    #Assert that the vocab is already exists
    RPA.windows.Click    ${ok_btn_id1}
    RPA.Windows.Get Element    name:"new_vocab.ce already exists.\r\nDo you want to replace it?"
