*** Settings ***
Resource            ../../Resources/resources.robot
Resource            ../../Resources/vocabularyAssertions.robot
Resource            ../../Resources/featuresAssertions.robot
Library            Process
Library            Dialogs
Library            AutoItLibrary



Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor

*** Test Cases ***
Validate feature "Create new button"
    Create new configuration of ChatEditor
    Select Nova Chat
    Select English
    Select Symbol Set: SymbolStix
    Create english user
    Maximize the window
    Sleep    3
    Set Resolution    ${window}    800        600
    Sleep    5
    Pause Execution
    # Reach Library of vocabs
    # Create new vocabulary
    # Create a new vocabulary file
    # Obține handle-ul ferestrei aplicației
    # Set Window Size    ${window_handle}    800    600


    # Pause Execution
    # ${score}=    SikuliLibrary.Get Match Score    E:\\Git\\e2e_chat_editor_robot\\images\\edit_mode_btn_enabled_assertion.png
#     Log    scoreul este: ${score}
#     Create new button
#     Customize the new button and select it

# Assertions
#     Assertions for feature "Create new button"
