*** Settings ***
Resource    ../resources/login.robot
Resource    ../resources/homepage.robot

*** Test Cases ***
login
    login with credentials    ${username}    ${password}
    