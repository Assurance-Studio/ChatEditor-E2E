# chatEditor_e2e

# Table of Contents

[Prerequisites – Software needed](#_toc164681923)

[Git\*](#_toc164681924)

[Visual Studio Code\*](#_toc164681925)

[Python and its packages](#_toc164681926)

[Python](#_toc164681927)

[Required Python packages](#_toc164681928)

[ChatEditor](#_toc164681929)

[How to get the robot files](#_toc164681930)

[Getting the code from GitHub – private repository](#_toc164681931)

[How to get the robot files](#_toc164681932)

[How to update the robot files – get the latest code](#_toc164681933)

[Running the tests and interpreting the results](#_toc164681934)

[Opening the results](#_toc164681935)

[Change Summary](#_toc164681936)

[Final Notes](#_toc164681937)

## <a name="_toc164681923"></a>Prerequisites – Software needed

-   \*Git\*\*
-   _Python_
-   _Python Library: PyAutoGUI_
-   \*Visual Studio Code\*\*
-   _Robot Framework_
-   _Python Library: robotframework_
-   _Python Library: rpaframework[windows]_
-   _Python Library: rpaframework-whitelibrary_

The software list is recommended for running the e2e suite. The ones marked with \* are not mandatory, but for making the process easier, they are nice to have.

-   Without _Git_ we would be unable to get the latest code from the server. A workaround for this is in place.
-   Without _Visual Studio Code_ we won’t be able to read the code in an understandable way, besides that it has integrated a Terminal (CMD).

## <a name="_toc164681924"></a>Git\*

1.  Download git from <https://git-scm.com/download/win> (64bit)
2.  Open the installer (leave all the option as they are in the installer)
3.  Next à Next à Next à Next à Next à Next à Next à Next à Next à Next à Next à Next à Next à Next à Next à _Install_
4.  Check Launch Git
5.  Uncheck View Release Notes
6.  Press _Finish_

Git should be installed now. The git terminal should open at the end.

## <a name="_toc164681925"></a>Visual Studio Code\*

1.  Download Visual Studio Code from <https://code.visualstudio.com/download> (64bit)
2.  Open the installer
3.  Accept the agreement à Next à Next à Next à Check “Add Open with Code” options à Next à _Install_
4.  Press _Finish_

Visual Studio Code should be installed. We can check this by opening it.

## <a name="_toc164681926"></a>Python and its packages

### <a name="_toc164681927"></a>Python

1.  Download Python from <https://www.python.org/downloads/release/python-3105/ >
2.  Press on “Download Python” button
3.  Open the installer
4.  Check Add python.exe to PATH => Install Now => Close

Python should be installed. We can check this by open a CMD window and type `python --version`, the result should be the version that we installed (3.10).

### <a name="_toc164681928"></a>Required Python packages

1.  Open a CMD window with administrator rights;
2.  Navigate to `C:\git`

Note: All the following commands should be run from `C:\Git, unless expressed otherwise

1.  Install PyAutoGUI library:
    PyAutoGUI is a Python library that allows users to automate interactions with the Graphical User Interface. It enables remote control of the mouse and keyboard using Python code, which is useful for automating repetitive tasks or interactions with desktop applications.

2.  Type
    `pip install pyautogui`
3.  Press Enter;
4.  The library should be installed;
5.  Install Robot Framework:

Description:
-   Robot Framework is a generic open-source automation framework for acceptance testing, acceptance test-driven development (ATDD), and robotic process automation (RPA).
-   It utilizes a simple, keyword-driven syntax that allows both technical and non-technical users to write test cases in a readable and understandable format.
-   Robot Framework supports a wide range of libraries and extensions for testing web applications, APIs, databases, desktop applications, and more.
-   It provides built-in reporting and logging capabilities, making it easy to track test execution results and debug test cases.
-   With its extensibility and flexibility, Robot Framework is widely used in agile and continuous integration/continuous deployment (CI/CD) environments for automating software testing and validation processes.

Using pip, which is the package manager for Python, install Robot Framework:

1.  Open a CMD window;
2.  Type
    `pip install robotframework`
3.  Press Enter;

Robot Framework should be installed. We can check this by open a CMD window and type robot --version, the result should be the version that we installed.

1.  Install Robot Framework libraries:
    Using `pip`, which is the package manager for Python, install RPA.Windows and RPA.Desktop libraries:

2.  Open a CMD window;
3.  Type
    `pip install robotframework[windows]`
4.  Press Enter;
5.  Type
    `pip install robotframework-whitelibrary`
6.  Press Enter;

PyAutoGUI, RPA.Windows, RPA.Desktop, and Robot Framework WhiteLibrary libraries should be installed. To check this by open a CMD window and type pip list which will generate a list of all installed Python packages and we can search in this list to see if the PyAutoGUI, RPA.Windows, RPA.Desktop and Robot Framework WhiteLibrary libraries are present.

## <a name="_toc164681929"></a>ChatEditor

For installing or uninstalling ChatEditor please consult the appropriate Work Instruction.

## <a name="_toc129013818"></a><a name="_toc164681930"></a>How to get the robot files

A robot file is a set of instructions that contain the code (steps) that the framework should follow in order to execute the tests.

There are two ways, and in this WI, both will be detailed. In case that you do not have git credentials, please follow the first one, but if you do have git credentials jump to the second portion of this chapter.

## <a name="_toc129013820"></a><a name="_toc164681931"></a>Getting the code from GitHub – private repository

1. Open in Visual Studio Code (Right click > open with Code) `C:\git`
2. Run the sh script in order to ad the SSH key to git.
3. In the _Terminal_ write `git clone https://github.com/Assurance-Studio/ChatEditor-E2E.git`
4. Now the code should be downloaded from git server, when it is done;
5. Please see the section[ (Running and Interpreting the results)](#_running_the_tests)
6. In order to start the run of the tests you should
    1. In a new terminal `(Ctrl+Shift+`) run `robot .\Tests`
17. The tests should be running.

## <a name="_toc129013820"></a><a name="_toc164681932"></a>How to update the robot files – get the latest code

The files are updated using Git commands executed in the Terminal, either in Command Prompt or in the Visual Studio Code terminal.
Navigate to `C:\git\Chat-EditorE2E`, then run the following commands in that order:
1.	`git reset --hard` - Discards all local changes and resets the working directory to match the latest committed state;
2.	`git clean -df` - Removes all untracked files and directories from the working directory, ensuring a clean environment;
3.	`git switch main` - Switches to the `main` branch;
4.	`git pull` - Fetches and merges the latest changes from the remote `main` branch locally;

## <a name="_running_the_tests"></a><a name="_toc164681934"></a>Running the tests and interpreting the results

Notes:

After all the steps in the previous two chapters have been done (getting the software and getting the code), we should be able now to run the tests:

1.  Open Visual Studio Code
1.  Select File -> Open Folder
1.  Select the folder in which you unzipped the files or the folder in which the project was cloned (it should be) `C:\git\ChatEditor-E2E`
1.  Open a new Terminal window and run:
1.  For running all the tests it’s simply `robot .\Tests`
1.  For running specific tests, it should be: (in italic we have the examples) 1. If we want to run a single file (the path to the file should be provided)
    `robot .\PATH_TO_FILE.robot`
    `robot .\Tests\Vocabulary\TouchChatEN\TouchChatEnglishSimbolstix\4BasicSS.robot`
1.  If we want to run a single folder (path to folder)
    `robot .\PATH_TO_FOLDER\`
    `robot .\Tests\Vocabulary\TouchChatEN\TouchChatEnglishSimbolstix\`
1.  If we want to run multiple files (path to files should be provided)
    `robot .\PATH_TO_FILE1.robot .\PATH_TO_FILE99.robot`
1.  After running the tests, we will be having a result in the terminal window:
1.  But if we want a full look of the run tests, we have to check log.html and report.html files – Explained in this [section](#_opening_the_results).

## <a name="_opening_the_results"></a><a name="_toc164681935"></a>Opening the results

After running the tests, two files with the results will be generated, <a name="_hlk161925053"></a>**log.html* and *report.html:**

1.  The _log.html_ file contains a detailed log of all events that occurred during the execution of tests. It provides information such as the start and end time of each test, along with any logging messages or error information that occurred during the test run.
1.  The _report.html_ file presents a summarized and easily readable report, providing an overview of the test results. It includes information such as the total number of tests executed, the number of tests passed successfully, the number of failed tests, and any tests that were skipped.

The two files can be opened in a web browser window for viewing.

Notes:

-   After each run, we should be keeping track of the results that we get;
-   We can do that by renaming the files _log.html_ and _report.html_ to the name of what we ran;
-   If we run multiple times, without renaming the folder, it can be difficult to get the true results.

## <a name="_toc164681936"></a>Change Summary

| Date        | Pg. | Par. | Summary comments |    Author     |  Approver   |
| ----------- | --- | ---- | ---------------- | :-----------: | :---------: |
| ` `22-04-24 | 0   | 6    | Created the WI   | ` `Valentin B |    ` `MN    |
| ` `22-04-24 | -   | -    | Modified the WI  |  ` `Marius N  | ` `JH,ED,VB |
|             |     |      |                  |               |             |

## <a name="_toc164681937"></a>Final Notes

Please take in consideration that this framework is not at its final stages, given this, changes might arise.
