*** Settings ***
Library           SeleniumLibrary
Resource          ../variables/variables.robot
Suite Setup       Open Browser To Registration Page
Suite Teardown    Close Browser

*** Keywords ***
Open Browser To Registration Page
    [Arguments]    ${url}=https://parabank.parasoft.com/parabank/index.htm    ${browser}=chrome
    Open Browser    ${url}    ${browser}    options=--headless,--no-sandbox,--disable-dev-shm-usage,--remote-debugging-port=9222
    Maximize Browser Window
    Set Selenium Speed    1

Click Registration
    Click Element    //*[@id="loginPanel"]/p[2]/a
    Page Should Contain    Signing up

Enter First Name Registration
    [Arguments]    ${first_name}
    Input Text    id:customer.firstName    ${first_name}

Enter Last Name Registration
    [Arguments]    ${last_name}
    Input Text    id:customer.lastName    ${last_name}

Enter Address Registration
    [Arguments]    ${address}
    Input Text    id:customer.address.street    ${address}

Enter City Registration
    [Arguments]    ${city}
    Input Text    id:customer.address.city    ${city}

Enter State Registration
    [Arguments]    ${state}
    Input Text    id:customer.address.state    ${state}

Enter Zipcode Registration
    [Arguments]    ${zip}
    Input Text    id:customer.address.zipCode    ${zip}

Enter Phone Registration
    [Arguments]    ${phone}
    Input Text    id:customer.phoneNumber    ${phone}

Enter SSN Registration
    [Arguments]    ${ssn}
    Input Text    id:customer.ssn    ${ssn}

Enter Username Registration
    [Arguments]    ${username}
    Input Text    id:customer.username    ${username}

Enter Password Registration
    [Arguments]    ${password}
    Input Password    id:customer.password    ${password}

Enter Confirm Password Registration
    [Arguments]    ${confirm_password}
    Input Password    id:repeatedPassword    ${confirm_password}

Click Register
    Click Element    //input[@value="Register"]

Validate New User
    Page Should Contain    Your account was created successfully. You are now logged in.

Register New User
    [Arguments]    ${first_name}    ${last_name}    ${address}    ${city}    ${state}    ${zip}    ${phone}    ${ssn}    ${username}    ${password}    ${confirm_password}
    Click Registration
    Enter First Name Registration       ${first_name}
    Enter Last Name Registration        ${last_name}
    Enter Address Registration          ${address}
    Enter City Registration             ${city}
    Enter State Registration            ${state}
    Enter Zipcode Registration          ${zip}
