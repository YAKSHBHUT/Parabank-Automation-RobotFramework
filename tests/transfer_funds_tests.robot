*** Settings ***
Resource    ../resources/account_page.robot


*** Test Cases ***
Transfer funds
    Transfer funds from 1st account to 2nd account
    Verify the transfer