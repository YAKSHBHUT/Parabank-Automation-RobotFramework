*** Settings ***
Resource    ../resources/account_page.robot

*** Test Cases ***
Account overview
    check account overview
    check account info is visible
