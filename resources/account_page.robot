*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/login.robot
Library    ../resources/verify_transfer.py

*** Keywords ***
check account overview
    ${status}=    Run Keyword And Return Status    Page Should Contain    Welcome
    IF    not ${status}
        Login With Credentials    ${username}    ${password}
    END
    Click Element    xpath=//a[text()='Accounts Overview']
    Element Should Be Visible    id=showOverview

check account info is visible
    ${status}=    Run Keyword And Return Status    Page Should Contain    Welcome
    IF    not ${status}
        Login With Credentials    ${username}    ${password}
    END
    Click Element    xpath=//a[text()='Accounts Overview']
    Element Should Be Visible    id:accountTable
    ${account}=    Get Table Cell    id:accountTable    row=2    column=1
    # Log To Console   account number is ${account}
    ${balance}=    Get Table Cell    id:accountTable    row=2    column=2
    # Log To Console    balance is ${balance}

    Should Not Be Empty    ${balance}
    Should Not Be Empty   ${account}

create checking account
    ${status}=    Run Keyword And Return Status    Page Should Contain    Welcome
    IF    not ${status}
        Login With Credentials    ${username}    ${password}
    END
    Click Element    //a[text()='Open New Account']
    Page Should Contain    Open New Account 
    Select From List By Label    id:type    CHECKING
    Click Element    //input[@value='Open New Account']    
    Page Should Contain    Congratulations, your account is now open.

create savings account
    ${status}=    Run Keyword And Return Status    Page Should Contain    Welcome
    Log To Console    ${status}
    IF    not ${status}
        Login With Credentials    ${username}    ${password}
    END
    Click Element    //a[text()='Open New Account']
    Page Should Contain    Open New Account 
    Select From List By Label    id:type    SAVINGS
    Click Element    //input[@value='Open New Account']    
    Page Should Contain    Congratulations, your account is now open.

Transfer funds from 1st account to 2nd account
    ${status}=    Run Keyword And Return Status    Page Should Contain    Welcome
    IF    not ${status}
        Login With Credentials    ${username}    ${password}
    END
    check account info is visible
    ${account_status}=    Get Element Count    //table[@id='accountTable']//tr
    IF    ${account_status}<=4
        create checking account        
    END
    ${first_amount}=    Get Table Cell    locator=id:accountTable    row=2    column=2
    ${first_account}=    Get Table Cell    id:accountTable    row=2    column=1
    ${second_amount}=    Get Table Cell    locator=id:accountTable    row=3    column=2
    ${second_account}=    Get Table Cell    id:accountTable    row=3    column=1
    ${first_amount}=    Evaluate    int(${first_amount}[1:])
    ${second_amount}=    Evaluate    int(${second_amount}[1:])
    Click Element    //a[text()="Transfer Funds"]
    ${to_transfer}=    Set Variable    100
    # Click Element    //input[@id='amount']
    Input Text    //input[@id='amount']    text=${to_transfer}
    Select From List By Label    //select[@id='fromAccountId']    ${first_account}
    Select From List By Label    //select[@id='toAccountId']    ${second_account}
    Click Button    //input[@value="Transfer"] 
    Page Should Contain    Transfer Complete!
    Set Suite Variable    ${FIRST_ACCOUNT}    ${first_account}
    Set Suite Variable    ${FIRST_AMOUNT}     ${first_amount}
    Set Suite Variable    ${SECOND_ACCOUNT}   ${second_account}
    Set Suite Variable    ${SECOND_AMOUNT}    ${second_amount}
    Set Suite Variable    ${TO_TRANSFER}    ${to_transfer}

Verify the transfer
    Click Element    xpath=//a[text()='Accounts Overview']
    check account overview
    ${V_first_amount}=    Get Table Cell    locator=id:accountTable    row=2    column=2
    ${V_second_amount}=    Get Table Cell    locator=id:accountTable    row=3    column=2
    ${V_first_amount}=    Evaluate    int(${V_first_amount}[1:])
    ${V_second_amount}=    Evaluate    int(${V_second_amount}[1:])
    ${FIRST_AMOUNT}=    Evaluate    int(${FIRST_AMOUNT})
    ${SECOND_AMOUNT}=   Evaluate    int(${SECOND_AMOUNT})
    ${TO_TRANSFER}=     Evaluate    int(${TO_TRANSFER})
    ${V_first_amount}=    Evaluate    int(${V_first_amount})
    ${V_second_amount}=   Evaluate    int(${V_second_amount})
    ${result}=    verify_transfer    
    ...    first_old_amount=${FIRST_AMOUNT}    
    ...    second_old_amount=${SECOND_AMOUNT}    
    ...    amount_transferred=${TO_TRANSFER}    
    ...    first_new_amount=${V_first_amount}    
    ...    second_new_amount=${V_second_amount}
    Log To Console  ${FIRST_AMOUNT}
    Log To Console  ${SECOND_AMOUNT}
    Log To Console  ${TO_TRANSFER}
    Should Be True    ${result}    msg=TRANSFER VERIFICATION FAILED!
    


    
    