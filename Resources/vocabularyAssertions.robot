*** Settings ***
Resource    ../Resources/resources.robot
Library     RPA.Windows
Library     OperatingSystem
Library     RPA.Desktop
Library     screen_resolution.py
Library     RPA.SAP
# Library     pytesseract
Library     pyautogui


*** Keywords ***
Check to see if the user exist
    ${text}=    RPA.Windows.Get Text    name:"ChatEditor • (EnglishUser)"
    Should Be Equal    ${text}    ChatEditor • (EnglishUser)

Check to see if the user exist - NederlandsUser
    ${text}=    RPA.Windows.Get Text    name:"ChatEditor • (NederlandsUser)"
    Should Be Equal    ${text}    ChatEditor • (NederlandsUser)

Check to see if the user exist - FrançaisUser
    ${text}=    RPA.Windows.Get Text    name:"ChatEditor • (FrançaisUser)"
    Should Be Equal    ${text}    ChatEditor • (FrançaisUser)

Check to see if the user exist - DeutschUser
    ${text}=    RPA.Windows.Get Text    name:"ChatEditor • (DeutschUser)"
    Should Be Equal    ${text}    ChatEditor • (DeutschUser)

Check to see if the user exist - EspañolUser
    ${text}=    RPA.Windows.Get Text    name:"ChatEditor • (EspañolUser)"
    Should Be Equal    ${text}    ChatEditor • (EspañolUser)

Check to see if the user exist - ArabicUser
    ${text}=    RPA.Windows.Get Text    name:"ChatEditor • (ArabicUser)"
    Should Be Equal    ${text}    ChatEditor • (ArabicUser)
