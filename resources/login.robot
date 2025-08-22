*** Settings ***
Resource   ../variables/variables.robot
Library    SeleniumLibrary

*** Keywords ***
open Login page
    Open Browser    browser=${browser}    url=${url}
    Maximize Browser Window
    Set Selenium Speed    1
    
Enter username
    [Arguments]    ${username}
    Input Text    name:username    text=${username}

Enter password
    [Arguments]    ${password}
    Input Password    name:password    password=${password}
    
Click Login button
    Click Element    //input[@value="Log In"]

Verify login 
    Page Should Contain    Welcome

login with credentials
    [Arguments]    ${username}    ${password}
    open Login page
    Enter username    ${username}
    Enter password    ${password}
    Click Login button
    Verify login

