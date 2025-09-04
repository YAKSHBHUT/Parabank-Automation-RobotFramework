*** Settings ***
Resource    ../resources/account_page.robot
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser

*** Test Cases ***
Account overview
    check account overview
    check account info is visible
