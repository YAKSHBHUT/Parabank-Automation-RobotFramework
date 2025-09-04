*** Settings ***
Resource    ../resources/login.robot
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser

*** Test Cases ***
login
    login with credentials    ${username}    ${password}
    