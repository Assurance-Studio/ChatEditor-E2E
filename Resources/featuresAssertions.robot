*** Settings ***
Resource    ../Resources/resources.robot
Library     RPA.Windows
Library     OperatingSystem
Library     RPA.Desktop
Library     String


*** Keywords ***
Assertions for feature "Create new button"
    # SikuliLibrary.Screen Should Contain    ${edit_btn_enabled}
    ${message}=    RPA.Windows.Get Value    id:1000
    ${message_no_whitespaces}=    String.Remove String    ${message}    ${SPACE}
    Should Match    ${message_no_whitespaces}    Hello
