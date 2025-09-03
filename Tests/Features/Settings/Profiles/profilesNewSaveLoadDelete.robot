*** Settings ***
Documentation       Check "Profiles" feature
Resource            ../../../../Resources/resources.robot
Resource            ../../../../Resources/vocabularyAssertions.robot

Suite Setup         Run Keywords    Delete Chat Editor Folder    AND    Open ChatEditor
Suite Teardown      Close ChatEditor

Library    Dialogs

*** Test Cases ***
Reach "Spelling SS" vocabulary
    Create new configuration of ChatEditor
    Select Touch Chat
    Select language            ${english}
    Select Symbol Set: SymbolStix without aditional vocabularies
    Create user                EnglishUser
    Maximize the window
    Reach Library of vocabs    l
    Select vocabulary    name:English    name:SymbolStix    NONE    ${spellingSS}

Create a new profile
    RPA.Desktop.Press Keys    alt    s
    RPA.Windows.Click    Profiles
    RPA.Windows.Click    id:32967
    #Get the pop up that explains what profiles do
    ${message}=    RPA.Windows.Get Text    id:1322
    Should Contain    ${message}    A Profile is used to save a User's settings and contains settings for Touch Screen, Switch Scanning, etc.  This is useful for supporting more than one user per device or for users who need different settings at various times (i.e., when they are  fatigued). Press Continue to create a New Profile or Cancel to exit.
    # Cancel the pop up
    RPA.Windows.Click    ${cancel_btn}
    RPA.Desktop.Press Keys    alt    s
    RPA.Windows.Click    Profiles
    RPA.Windows.Click    id:32967
    RPA.Windows.Click    id:1
    ${text}=    RPA.Windows.Get Text    name:"Create a New Profile"
    Should Be Equal    ${text}    Create a New Profile
    Send Keys    id:1034    Adam    interval=0.02
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    enter

Make some changes to the profile settings
    #Button Style
    RPA.Desktop.Press Keys    alt    s
    RPA.Windows.Click    Style
    RPA.Windows.Click    Button Style...
    #Activate "No Show" checkbox
    RPA.windows.Click    id:10005
    #Check that the "Size" setting for navigation icons is disabled
    ${isEnabled}=    Get Attribute    id:1102    IsEnabled
    Should Be Equal    ${isEnabled}    0    formater=int|boolean
    #Uncheck "Saturation"
    RPA.windows.Click    id:1296
    #Check that the saturation percent is disabled
    ${isEnabled}=    Get Attribute    id:1297    IsEnabled
    Should Be Equal    ${isEnabled}    0    formater=int|boolean
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    enter

Save the changes to the profile
    RPA.Desktop.Press Keys    alt    s
    RPA.Windows.Click    Profiles
    RPA.Windows.Click    name:Save...
    ${text}=    RPA.Windows.Get Text    name:"Save User Profile"
    Should Be Equal    ${text}    Save User Profile
    ${text}=    RPA.Windows.Get Element    name:Adam
    RPA.Desktop.Press Keys    down
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    enter

Load the profile
    RPA.Desktop.Press Keys    alt    s
    RPA.Windows.Click    Profiles
    RPA.Windows.Click    name:Load...
    ${text}=    RPA.Windows.Get Text    name:"Load User Profile"
    Should Be Equal    ${text}    Load User Profile
    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    enter
    # Verify that the profile loads with its settings
    #Check that the "Size" setting for navigation icons is disabled
    RPA.Desktop.Press Keys    alt    s
    RPA.Windows.Click    Style
    RPA.Windows.Click    Button Style...
    ${isEnabled}=    Get Attribute    id:1102    IsEnabled
    Should Be Equal    ${isEnabled}    0
    #Check that the saturation percent is disabled
    ${isEnabled}=    Get Attribute    id:1297    IsEnabled
    Should Be Equal    ${isEnabled}    0    formater=int|boolean
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    enter

Load Default Settings
    RPA.Desktop.Press Keys    alt    s
    RPA.Windows.Click    Profiles
    RPA.Windows.Click    name:Load...
    RPA.windows.Click    id:1509
    RPA.Desktop.Press Keys    alt    s
    RPA.Windows.Click    Style
    RPA.Windows.Click    Button Style...
    #Check that the "Size" setting for navigation icons is enabled
    ${isEnabled}=    Get Attribute    id:1102    IsEnabled
    Should Be Equal    ${isEnabled}    1    formater=int|boolean
    #Check that the saturation percent is enabled
    ${isEnabled}=    Get Attribute    id:1297    IsEnabled
    Should Be Equal    ${isEnabled}    1    formater=int|boolean
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    enter

Delete the profile
    RPA.Desktop.Press Keys    alt    s
    RPA.Windows.Click    Profiles
    RPA.Windows.Click    name:Delete...
    ${text}=    RPA.Windows.Get Text    name:"Delete User Profile"
    Should Be Equal    ${text}    Delete User Profile
    RPA.Desktop.Press Keys    up
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    enter
    ${text}=    RPA.Windows.Get Text    id:65535
    Should Contain    ${text}    Profile "Adam" has been deleted.
    RPA.Windows.Click    ${ok_btn_id2}
