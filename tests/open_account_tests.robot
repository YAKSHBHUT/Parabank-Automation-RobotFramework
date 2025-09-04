*** Settings ***
Resource    ../resources/account_page.robot

*** Test Cases ***
Savings account creation
    create savings account
    Verify the account opening

Checking account creation
    create checking account
    Verify the account opening