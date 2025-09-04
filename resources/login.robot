*** Settings ***
Resource    ../variables/variables.robot
Library     SeleniumLibrary
Suite Setup     Open Browser To Login Page
Suite Teardown  Close Browser

*** Keywords ***
Open Browser To Login Page
    Open Browser    https://parabank.parasoft.com/parabank/index.htm    chrome
    Maximize Browser Window
    Set Selenium Speed    1
    # If running in GitHub Actions, use headless mode:
    # options=--headless,--no-sandbox,--disable-dev-shm-usage,--remote-debugging-port=9222

Enter Username
    [Arguments]    ${username}
    Input Text    name=username    ${username}

Enter Password
    [Arguments]    ${password}
    Input Password    name=password    ${password}

Click Login Button
    Click Element    //input[@value="Log In"]

Verify Login
    Page Should Contain    Welcome

Login With Credentials
    [Arguments]    ${username}    ${password}
    Enter Username    ${username}
    Enter Password    ${password}
    Click Login Button
    Verify Login
