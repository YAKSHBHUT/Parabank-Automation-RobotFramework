*** Settings ***
Resource    ../resources/account_page.robot
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser

*** Test Cases ***
Savings account creation
    create savings account
    Verify the account opening

Checking account creation
    create checking account
    Verify the account opening