*** Settings ***
Library    SeleniumLibrary
Resource    ../variables/variables.robot


*** Keywords ***
Clean_db
    Open Browser    browser=${browser}    url=${url}
    Set Selenium Speed    1s
    Maximize Browser Window
    Click Element    //a[text()='Admin Page']
    Page Should Contain    Administration
    Click Button    //button[@value='CLEAN']    
    Page Should Contain    Database Cleaned        

*** Test Cases ***
First_time
    Clean_db
