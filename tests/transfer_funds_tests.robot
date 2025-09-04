*** Settings ***
Resource    ../resources/account_page.robot
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser

*** Test Cases ***
Transfer funds
    Transfer funds from 1st account to 2nd account
    Verify the transfer