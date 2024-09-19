*** Settings ***
Documentation       Check "Pixon" ENGLISH vocabulary
Resource            ../../../../../Resources/resources.robot
Resource            ../../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor
Library    Dialogs

*** Test Cases ***
Validate "Pixon" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select language            ${english}
    Select Symbol Set: SymbolStix&Pixon
    Create user                EnglishUser
    Control Window    name:"ChatEditor • (EnglishUser)"
    Reach Library of vocabs    l
    Select Pixon vocabulary
# Assertions
# # Check to see if there is a picture of the vocabulary icons - Pixon
# #     Add Image Path    ${image_path_vocabularies}
# #     SikuliLibrary.Screen Should Contain    pixonVocabularyGrid.png

#     # Check to see if the dictionary's name is included in the text box - Pixon
#     RPA.Windows.Click    ${edit_mode_btn}
#     ${message}=    RPA.Windows.Get Text    id:65535

#     Should Contain    ${message}    The vocabulary "Pixon"
#     RPA.Windows.Click    id:7

#     # Check to see if the dictionary's 'name' attribute is its actual name - Pixon
#     RPA.Desktop.Press Keys    alt    l
#     RPA.Windows.Click    name:English
#     RPA.Windows.Click    name:Pixon
#     ${name}=    RPA.Windows.Get Attribute    name:"Pixon (Current)"    Name
#     Should Be Equal    ${name}    Pixon (Current)
