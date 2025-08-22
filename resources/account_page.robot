*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/login.robot

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
    Select From List By Label    id:type    SAVINGS
    Click Element    //input[@value='Open New Account']    
    Page Should Contain    Congratulations, your account is now open.

Saving account status check
    ${status}=    Run Keyword And Return Status    Page Should Contain    Welcome
    IF    not ${status}
        Login With Credentials    ${username}    ${password}
    END
    check account info is visible
    ${account_status}=    Get Element Count    //table[@id='accountTable']//tr
    # Log To Console   number of rows ${account_status}
    IF    ${account_status}<=4
        create checking account
    ELSE
        ${to_transfer}=    Get Table Cell    locator=id:accountTable    row=2    column=2
        ${to_transfer}=    Evaluate    ${to_transfer}[1:]
        ${to_transfer}=    Convert To Number    ${to_transfer}
        ${to_transfer}=    Evaluate    ${to_transfer}/2
        Log To Console     ${to_transfer}
        # Click Element    //a[text()="Transfer Funds"]
            
    END
    