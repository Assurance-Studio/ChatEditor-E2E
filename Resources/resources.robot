*** Settings ***
Library     RPA.Windows
Library     OperatingSystem
Library     RPA.Desktop
Library     String
Library     screen_resolution.py
Library     pyautogui

*** Variables ***
# ----------------------------------PATH-----------------------------------------------------
${chatEditorPath}                                "C:/Program Files (x86)/Chat Editor/Chat Editor.exe"

# ----------------------------------BUTTONS-----------------------------------------------------
${ok_btn_id1}                                    id:1
${ok_btn_id2}                                    id:2
${myResources}                                   name:"My Resources"
${edit_mode_btn}                                 name:"Edit Mode"
${edit_mode_btn_english&hebrew}                  name:"מצב עריכה"
${edit_mode_btn_english&nederlands}              name:Bewerkmodus
${edit_mode_btn_english&français}                name:"Mode de modification"
${edit_mode_btn_english&deutsch}                 name:Editiermodus
${edit_mode_btn_english&espanol}                 name:"Modo de edición"
${page_down_button}                              id:DownPageButton
${productDropbox}                                id:1585
${languageDropbox}                               id:1587
${symbolSetDropbox}                              id:1586

# Products
${NovaChat/ChatFusion}                           name:"Nova Chat/Chat Fusion"
${TouchChat}                                     name:TouchChat
${wordsForLife}                                  name:"Words For Life (Nova Edition)"
${dialogue}                                      name:Dialogue

# Languages
${english}                                       name:English
${english&Nederlands}                            name:"English & Nederlands"
${english&Français}                              name:"English & Français"
${english&Deutsch}                               name:"English & Deutsch"
${english&Español}                               name:"English & Español"
${english&Arabic}                                name:"English & Arabic"
${english&Hebrew}                                name:"English & Hebrew"

# Symbol Sets
${symbolStix}                                    name:SymbolStix
${PCS}                                           name:PCS
${metacom}                                       name:Metacom
${symbolStix&PCS}                                name:"SymbolStix & PCS"
${symbolStix&Pixon}                              name:"SymbolStix & Pixon"

# ----------------------------------VOCABULARIES-----------------------------------------------------
#English vocabularies
${4BasicSS}                                      name:"4-Basic SS (Current)"
${communicationJourneyAphasiaSS}                 name:"Communication Journey Aphasia SS"
${communicationJourneyAphasiaUKSS}               name:"Communication Journey Aphasia UK SS"
${engageForiOSSS}                                name:"Engage for iOS SS"
${multiChat15AdolescentSS}                       name:"MultiChat 15 Adolescent SS"
${multiChat15AdultSS}                            name:"MultiChat 15 Adult SS"
${multiChat15StudentSS}                          name:"MultiChat 15 Student SS"
${myCoreSS}                                      name:"myCore SS"
${myQuickChat4ChildSS}                           name:"myQuickChat 4 Child SS"
${myQuickChat8AdultSS}                           name:"myQuickChat 8 Adult SS"
${myQuickChat8ChildSS}                           name:"myQuickChat 8 Child SS"
${myQuickChat12AdultSS}                          name:"myQuickChat 12 Adult SS"
${myQuickChat12ChildSS}                          name:"myQuickChat 12 Child SS"
${sinSintaxis4x4EnglishSS}                       name:"sin sintaxis 4x4 English SS"
${sintaxis4x5EnglishSS}                          name:"sintaxis 4x5 English SS"
${spellingSS}                                    name:"Spelling SS"
${vocabPCAdolescent-AdultSS}                     name:"VocabPC Adolescent-Adult SS"
${4BasicPCS}                                     name:"4-Basic PCS"
${communicationJourneyAphasiaPCS}                name:"Communication Journey Aphasia PCS"
${communicationJourneyAphasiaUKPCS}              name:"Communication Journey Aphasia UK PCS"
${engageForiOSPCS}                               name:"Engage for iOS PCS"
${multiChat15AdolescentPCS}                      name:"MultiChat 15 Adolescent PCS"
${multiChat15AdultPCS}                           name:"MultiChat 15 Adult PCS"
${multiChat15StudentPCS}                         name:"MultiChat 15 Student PCS"
${myCorePCS}                                     name:"myCore PCS"
${myQuickChat4ChildPCS}                          name:"myQuickChat 4 Child PCS"
${myQuickChat8AdultPCS}                          name:"myQuickChat 8 Adult PCS"
${myQuickChat8ChildPCS}                          name:"myQuickChat 8 Child PCS"
${myQuickChat12AdultPCS}                         name:"myQuickChat 12 Adult PCS"
${myQuickChat12ChildPCS}                         name:"myQuickChat 12 Child PCS"
${sinSintaxis4x4EnglishPCS}                      name:"sin sintaxis 4x4 English PCS"
${sintaxis4x5EnglishPCS}                         name:"sintaxis 4x5 English PCS"
${spellingPCS}                                   name:"Spelling PCS"
${vocabPCAdolescent-AdultPCS}                    name:"VocabPC Adolescent-Adult PCS"
${wordPower20SimplySS}                           name:"WordPower20 Simply SS"
${wordPower25Touch&ScanSS}                       name:"WordPower25 Touch & Scan SS"
${wordPower42BasicSS}                            name:"WordPower42 Basic SS"
${wordPower42SS}                                 name:"WordPower42 SS"
${wordPower48SS}                                 name:"WordPower48 SS"
${wordPower60SS}                                 name:"WordPower60 SS"
${wordPower80SS}                                 name:"WordPower80 SS"
${wordPower108SS}                                name:"WordPower108 SS"
${wordPower108wKeyboardSS}                       name:"WordPower108 w Keyboard SS"
${wordPower140Scan&TouchSS}                      name:"WordPower140 Scan & Touch SS"
${talkAbout}                                     name:"Talk-About"
${gateway12Child}                                name:"Gateway 12 Child"
${gateway20Child}                                name:"Gateway 20 Child"
${gateway20Teen}                                 name:"Gateway 20 Teen"
${gateway30Teen}                                 name:"Gateway 30 Teen"
${gateway40Child}                                name:"Gateway 40 Child"
${gateway40Teen}                                 name:"Gateway 40 Teen"
${gateway40Text}                                 name:"Gateway 40 Text"
${gateway66Child}                                name:"Gateway 66 Child"
${gateway66Teen}                                 name:"Gateway 66 Teen"
${gateway66Text}                                 name:"Gateway 66 Text"
${gatewayPro}                                    name:"Gateway Pro"
${intermediateScanSS}                            name: "Intermediate Scan SS"
${exploreAccessSS}                               name: "Explore Access SS"
${intermediateScanPCS}                           name: "Intermediate Scan PCS"
${exploreAccessPCS}                              name: "Explore Access PCS"
${wordPower20SimplyPCS}                          name:"WordPower20 Simply PCS"
${wordPower25Touch&ScanPCS}                      name:"WordPower25 Touch & Scan PCS"
${wordPower42BasicPCS}                           name:"WordPower42 Basic PCS"
${wordPower42PCS}                                name:"WordPower42 PCS"
${wordPower48PCS}                                name:"WordPower48 PCS"
${wordPower60BasicPCS}                           name:"WordPower60 Basic PCS"
${wordPower60PCS}                                name:"WordPower60 PCS"
${wordPower80PCS}                                name:"WordPower80 PCS"
${wordPower108PCS}                               name:"WordPower108 PCS"
${wordPower108wKeyboardPCS}                      name:"WordPower108 w Keyboard PCS"
${wordPower140Scan&TouchPCS}                     name:"WordPower140 Scan & Touch PCS"
${lamp84Full}                                    name:"LAMP 84 Full"
${lamp84OneHit}                                  name:"LAMP 84 One Hit"
${lamp84Transition}                              name:"LAMP 84 Transition"
${essence60}                                     name:"Essence 60"
${essence84}                                     name:"Essence 84"

# English&Nederlands vocabularies
${myQuickChat4KinddSS}                           name:"myQuickChat 4 Kind SS"
${myQuickChat8KindSS}                            name:"myQuickChat 8 Kind SS"
${myQuickChat12KindSS}                           name:"myQuickChat 12 Kind SS"
${myQuickChat4KindPCS}                           name:"myQuickChat 4 Kind PCS"
${myQuickChat8KindPCS}                           name:"myQuickChat 8 Kind PCS"
${myQuickChat12KindPCS}                          name:"myQuickChat 12 Kind PCS"

# English&Français vocabularies
${4DeBaseFrançaisSS}                             name:"4 de base français SS"
${communicationJourneyAphasiaFrançaisSS}         name:"Communication Journey Aphasie français SS"
${multiChat15FrançaisSS}                         name:"MultiChat 15 français SS"
${vocabPCFrançaisSS}                             name:"VocabPC français SS"
${wordPower60FrançaisSS}                         name:"WordPower60 français SS"
${wordPower120FrançaisAZERTYSS}                  name:"WordPower120 français AZERTY SS"
${wordPower120FrançaisSS}                        name:"WordPower120 français SS"
${epelerFrancaisSS}                              name:"Épeler français SS"
${4DeBaseFrançaisPCS}                            name:"4 de base français PCS"
${communicationJourneyAphasiaFrançaisPCS}        name:"Communication Journey Aphasie français PCS"
${multiChat15FrançaisPCS}                        name:"MultiChat 15 français PCS"
${vocabPCFrançaisPCS}                            name:"VocabPC français PCS"
${wordPower60FrançaisPCS}                        name:"WordPower60 français PCS"
${wordPower120FrançaisAZERTYPCS}                 name:"WordPower120 français AZERTY PCS"
${wordPower120FrançaisPCS}                       name:"WordPower120 français PCS"
${epelerFrancaisPCS}                             name:"Épeler français PCS"

# English&Deutsch vocabularies
${ABC6}                                          name:"ABC 6"
${ABC45_3.0}                                     name:"ABC 45 3.0"
${ABC50_3.0}                                     name:"ABC 50 3.0"
${ABC60_3.0}                                     name:"ABC 60 3.0"
${rehaFoXX2.0_24PCS}                             name:"RehaFoXX 2.0 24 PCS"
${ABC45Metacom3.0}                               name:"ABC 45 Metacom 3.0"
${ABC50Metacom3.0}                               name:"ABC 50 Metacom 3.0"
${ABC60Metacom3.0}                               name:"ABC 60 Metacom 3.0"
${EKS_15_2.1}                                    name:"EKS 15 2.1"
${EKS_45_2.1}                                    name:"EKS 45 2.1"
${loGoFoXX15_2.0}                                name:"LoGoFoXX 15 2.0"
${loGoFoXX24_2.0}                                name:"LoGoFoXX 24 2.0"
${loGoFoXX32_2.0}                                name:"LoGoFoXX 32 2.0"
${loGoFoXX60_2.0}                                name:"LoGoFoXX 60 2.0"
${loGoFoXX84_1.0}                                name:"LoGoFoXX 84 1.0"
${multiFoXX24_1.1}                               name:"MultiFoXX 24 1.1"
${multiFoXX45}                                   name:"MultiFoXX 45"
${rehaFoXX1.02}                                  name:"RehaFoXX 1.02"

# English&Español vocabularies
${communicationJourneyAfasiaEspanolSS}           name:"Communication Journey Afasia Español SS"
${multiChat15BilingualSS}                        name:"MultiChat 15 Bilingual SS"
${multiChat15EspañolSS}                          name:"MultiChat 15 Español SS"
${sinSintaxis4x4EspañolSS}                       name:"sin sintaxis 4x4 Español SS"
${sintaxis4x5EspañolSS}                          name:"sintaxis 4x5 Español SS"
${tecladoSS}                                     name:"teclado SS"
${vocabPCEspañolSS}                              name:"VocabPC Español SS"
${wordPower25EspanolSS}                          name:"WordPower25 Español SS"
${wordPower48EspanolBasicoSS}                    name:"WordPower48 Español Básico SS"
${wordPower48EspanolSS}                          name:"WordPower48 Español SS"
${wordPower60EspanolBasicoSS}                    name:"WordPower60 Español Básico SS"
${communicationJourneyAfasiaEspanolPCS}          name:"Communication Journey Afasia Español PCS"
${multiChat15BilingualPCS}                       name:"MultiChat 15 Bilingual PCS"
${multiChat15EspanolPCS}                         name:"MultiChat 15 Español PCS"
${sinSintaxis4x4EspañolPCS}                      name:"sin sintaxis 4x4 Español PCS"
${sintaxis4x5EspañolPCS}                         name:"sintaxis 4x5 Español PCS"
${tecladoPCS}                                    name:"teclado PCS"
${vocabPCEspañolPCS}                             name:"VocabPC Español PCS"
${wordPower25EspanolPCS}                         name:"WordPower25 Español PCS"
${wordPower48EspanolBasicoPCS}                   name:"WordPower48 Español Básico PCS"
${wordPower48EspanolPCS}                         name:"WordPower48 Español PCS"
${wordPower60EspanolBasicoPCS}                   name:"WordPower60 Español Básico PCS"
${essence60Espanol}                              name:"Essence 60 Español"
${essence84Espanol}                              name:"Essence 84 Español"

# English&Arabic vocabularies
${referendumBoard16}                             name:"	لوحة استثفاء 16"
${adultPanel20}                                  name:"لوحة البالغين 20"
${keyboardWithAddOns}                            name:"لوحة المفاتيح مع إضافات"
${focusSharePanel16}                             name:"لوحة حصة التركيز 16"
${panel4}                                        name:"لوحة ٤ 4"
${panel9}                                        name:"لوحة ٩ 9"
${panel12}                                       name:"لوحة ١٢ 12"
${panel15}                                       name:"لوحة ١٥ 15"

# English&Hebrew vocabularies
${board9ForChildrenOrTeenagers}                  name:"לוח 9 לילדים או מתבגרים"
${board12}                                       name:"לוח 12"
${integratedBoard15ForSchoolChildren}            name:"לוח 15 משולב לילדי בית ספר"
${basic4Board}                                   name:"לוח ארבע בסיסי"
${wardBoardWithoutSymbols}                       name:"לוח אשפוז ללא סמלים"
${hospitalizationBoardWithSymbols}               name:"לוח אשפוז עם סמלים"
${adultsBoard}                                   name:"לוח מבוגרים"
${boardWithAdditions}                            name:"לוח ׳מקלדת׳ עם תוספות"

# ----------------------------------CONFIGURATION LANGUAGES-----------------------------------------------------
${configuration}                                 name:"Create New Configuration"
${window}                                        ChatEditor • (EnglishUser)
${windowNederlands}                              ChatEditor • (NederlandsUser)
${windowFrançais}                                ChatEditor • (FrançaisUser)
${windowDeutsch}                                 ChatEditor • (DeutschUser)
${windowEspañol}                                 ChatEditor • (EspañolUser)
${windowArabic}                                  ChatEditor • (ArabicUser)
${windowHebrew}                                  ChatEditor • (HebrewUser)

*** Keywords ***
# ----------------------------------SETUP & TEARDOWN-----------------------------------------------------
Open ChatEditor
    Windows Run    ${chatEditorPath}

Close ChatEditor
    OperatingSystem.Run    taskkill /F /IM "Chat Editor.exe"

Delete Chat Editor Folder
    ${username}=    Get Environment Variable    USERNAME
    ${folderPath}=    Set Variable    C:\\Users\\${username}\\AppData\\Roaming\\Chat Editor
    OperatingSystem.Remove Directory    ${folderPath}    recursive=True
    # Copy Directory    D:\\Git\\e2e_chat_editor_robot\\Data\\Chat Editor  ${folderPath}
    Copy Directory    Data\\Chat Editor  ${folderPath}

# ----------------------------------PRODUCTS-----------------------------------------------------
Select Nova Chat
    RPA.Windows.Click    ${productDropbox}
    RPA.Windows.Click    ${NovaChat/ChatFusion}
    RPA.Windows.Click    id:1592

Select Touch Chat
    RPA.Windows.Click    ${productDropbox}
    RPA.Windows.Click    ${TouchChat}
    RPA.Windows.Click    id:1592

Select Words For Life (Nova Edition)
    RPA.Windows.Click    ${productDropbox}
    RPA.Windows.Click    ${wordsForLife}
    RPA.Windows.Click    id:1592

Select Dialogue
    RPA.Windows.Click    ${productDropbox}
    RPA.Windows.Click    ${dialogue}
    RPA.Windows.Click    id:1592
# ----------------------------------LANGUAGES-----------------------------------------------------
Select language
    [Arguments]          ${language}
    RPA.Windows.Click    ${languageDropbox}
    RPA.Windows.Click    ${language}
    RPA.Windows.Click    id:1592

Create new configuration of ChatEditor
    RPA.Windows.Click    id:1589
    RPA.Windows.Click    ${configuration}
    RPA.Windows.Click    id:1591

# ----------------------------------SYMBOL SET(S)-----------------------------------------------------
#NOVACHAT
Select Symbol Set: SymbolStix
    RPA.Windows.Click    ${symbolSetDropbox}
    RPA.Windows.Click    ${symbolStix}
    RPA.Windows.Click    id:1592

Select Symbol Set: PCS
    RPA.Windows.Click    ${symbolSetDropbox}
    RPA.Windows.Click    ${PCS}
    RPA.Windows.Click    id:1592

Select Symbol Set: Metacom
    RPA.Windows.Click    ${symbolSetDropbox}
    RPA.Windows.Click    ${metacom}
    RPA.Windows.Click    id:1592

#TOUCHCHAT
Select Symbol Set: SymbolStix without aditional vocabularies
    RPA.Windows.Click    ${symbolSetDropbox}
    RPA.Windows.Click    ${symbolStix}
    RPA.Windows.Click    id:1592
    RPA.Windows.Click    id:1592

Select Symbol Set: SymbolStix&PCS without aditional vocabularies
    [Arguments]          ${excludeLastLine}= False
    RPA.Windows.Click    ${symbolSetDropbox}
    RPA.Windows.Click    ${symbolStix&PCS}
    RPA.Windows.Click    id:1592
    Run Keyword Unless   ${excludeLastLine}    RPA.Windows.Click    id:1592

Select Symbol Set: SymbolStix&Pixon
    RPA.Windows.Click    ${symbolSetDropbox}
    RPA.Windows.Click    ${symbolStix&Pixon}
    RPA.Windows.Click    id:1592
    RPA.Windows.Click    name:Pixon
    RPA.Desktop.Press Keys    space
    RPA.Windows.Click    id:1592

Select Symbol Set: SymbolStix with WordPower aditional vocabulary
    RPA.Windows.Click    ${symbolSetDropbox}
    RPA.Windows.Click    ${symbolStix}
    RPA.Windows.Click    id:1592
    RPA.Windows.Click    name:WordPower
    RPA.Desktop.Press Keys    space
    RPA.Windows.Click    id:1592

Select Symbol Set: SymbolStix with Talk-About aditional vocabulary
    RPA.Windows.Click    ${symbolSetDropbox}
    RPA.Windows.Click    ${symbolStix}
    RPA.Windows.Click    id:1592
    RPA.Windows.Click    name:"Talk About"
    RPA.Desktop.Press Keys    space
    RPA.Windows.Click    id:1592

Select Symbol Set: SymbolStix with Gateway aditional vocabulary
    RPA.Windows.Click    ${symbolSetDropbox}
    RPA.Windows.Click    ${symbolStix}
    RPA.Windows.Click    id:1592
    RPA.Windows.Click    name:Gateway
    RPA.Desktop.Press Keys    space
    RPA.Windows.Click    id:1592

# ----------------------------------CREATE USERS-----------------------------------------------------
Create user
    [Arguments]    ${user}
    Send Keys    id:1034    ${user}
    RPA.Windows.Click    ${ok_btn_id1}

# ----------------------------------FEATURES-----------------------------------------------------
Reach Library of vocabs
    [Arguments]    ${char}
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    ${char}

Reach Library of Hebrew vocabs
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    left
    RPA.Desktop.Press Keys    enter

Create new vocabulary
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    enter
    RPA.Windows.Click    ${ok_btn_id1}

Create a new vocabulary file
    Send Keys    id:1034    new_vocab_file_name
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    enter
    RPA.Windows.Click    id:2
    Send Keys    id:1034    page1
    RPA.Desktop.Press Keys    alt
    RPA.Desktop.Press Keys    enter
    RPA.Windows.Click    name:Close

# ----------------------------------OTHERS-----------------------------------------------------
Maximize the window
    RPA.Desktop.Press Keys    alt    space
    RPA.Desktop.Press Keys    x

# ----------------------------------SELECT VOCABULARIES-----------------------------------------------------
Select Vocabulary
    [Arguments]    ${language}=NONE    ${symbolSet}=NONE    ${additionalVocabularies}=NONE    ${vocabName}=NONE    ${downPageButton}=id:DownPageButton
    Run Keyword If    '${language}' != 'NONE'    RPA.Windows.Click    ${language}
    Run Keyword If    '${symbolSet}' != 'NONE'    RPA.Windows.Click    ${symbolSet}
    Run Keyword If    '${additionalVocabularies}' != 'NONE'    RPA.Windows.Click    ${additionalVocabularies}
    # Run Keyword If    '${downPageButton}' != 'NONE'    RPA.Windows.Click    ${downPageButton}
    Run Keyword If    '${vocabName}' != 'NONE'    Click Vocabulary Based On Visibility    ${downPageButton}    ${vocabName}
    RPA.Windows.Click    id:33674

Click Vocabulary Based On Visibility
    [Arguments]    ${downPageButton}    ${vocabName}
    ${visible}=    RPA.Windows.Get Element    ${vocabName}
    ${click_successful}=    Run Keyword And Return Status    RPA.Windows.Click    ${vocabName}
    Run Keyword If    '${click_successful}' == 'True'
    ...    Log    "The element ${vocabName} was clicked successfully."
    ...    ELSE
    ...    Run Keywords    RPA.Windows.Click    ${downPageButton}    AND    RPA.Windows.Click    ${vocabName}
