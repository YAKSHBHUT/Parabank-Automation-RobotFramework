*** Settings ***
Resource    ../resources/login.robot


*** Test Cases ***
login
    login with credentials    ${username}    ${password}
    