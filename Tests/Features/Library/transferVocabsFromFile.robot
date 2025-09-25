# *** Settings ***
# Documentation       Check "Transfer - Vocabs From File" feature
# Resource            ../../../Resources/resources.robot
# Resource            ../../../Resources/vocabularyAssertions.robot

# Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
# Suite Teardown      Close ChatEditor

# Library    Dialogs

# *** Test Cases ***
# Reach "4-Basic SS" vocabulary
#     Create new configuration of ChatEditor
#     Select Touch Chat
#     Select language            ${english}
#     Select Symbol Set: SymbolStix without aditional vocabularies
#     Create user                EnglishUser
#     Maximize the window
#     Reach Library of vocabs    l
#     Select vocabulary    name:English    name:SymbolStix    NONE    ${4BasicSS}

# Reach "Transfer Vocabs From File" modal
#     Reach Library of vocabs    l
#     RPA.Desktop.Press Keys    alt
#     RPA.Desktop.Press Keys    right
#     RPA.Desktop.Press Keys    right
#     RPA.Desktop.Press Keys    right
#     RPA.Desktop.Press Keys    right
#     RPA.Desktop.Press Keys    enter
#     RPA.Windows.Click    id:33692
#     RPA.Windows.Get Element    name:"Select a Vocab File To Import"

# Transfer the vocab from file
#     #Set the path where the vocabulary was saved
#     RPA.Windows.Right Click    id:41477
#     RPA.windows.Click    id:1280
#     Send Keys    id:41477    ${transferVocabsToFilePath}
#     #Transfer the vocab
#     RPA.Windows.Double Click    name:new_vocab.ce    wait_time=10
#     RPA.Windows.Get Element    name:"Resource Browser - Library"

# Assert that the vocab was correctly imported
#     RPA.windows.Click    name:new_vocab
#     RPA.windows.Click    id:33674
#     Reach Library of vocabs    l
#     RPA.Windows.Click    "My Resources"
#     #Confirm that the current vocab is the "new_vocab" vocabulary
#     RPA.Windows.Get Element    name:"new_vocab (Current)"
