*** Settings ***
Library    SeleniumLibrary
Resource    ../variables/variables.robot

*** Keywords ***
open page
    Open Browser    browser=${browser}    url=${url}
    Maximize Browser Window
    Set Selenium Speed    1

click Registration
    Click Element    //*[@id="loginPanel"]/p[2]/a
    Page Should Contain    Signing up

enter first_name_registration
    [Arguments]    ${first_name}
    Input Text    id:customer.firstName    ${first_name}

enter last_name_registration
    [Arguments]    ${last_name}
    Input Text    id:customer.lastName    ${last_name}

enter address_registration
    [Arguments]    ${address}
    Input Text    id:customer.address.street    ${address}

enter city_registration
    [Arguments]    ${city}
    Input Text    id:customer.address.city    ${city}

enter State_registration
    [Arguments]    ${state}
    Input Text    id:customer.address.state   ${state}

enter zipcode_registration
    [Arguments]    ${zip}
    Input Text    id:customer.address.zipCode   ${zip}

enter phone_registration
    [Arguments]    ${phone}
    Input Text    id:customer.phoneNumber   ${phone}

enter ssn_registration
    [Arguments]    ${ssn}
    Input Text    id:customer.ssn   ${ssn}

enter username_registration
    [Arguments]    ${username}
    Input Text    id:customer.username  ${username}

enter password_registration
    [Arguments]    ${password}
    Input Password    id:customer.password    ${password}

enter confirm_password_registration
    [Arguments]    ${confirm_password}
    Input Password    id:repeatedPassword    ${confirm_password}

click register
    Click Element    //input[@value="Register"]

validate new user
    Page Should Contain    Your account was created successfully. You are now logged in.

register new user
    [Arguments]    ${first_name}    ${last_name}    ${address}    ${city}    ${state}    ${zip}    ${phone}    ${ssn}    ${user_name}    ${password}    ${confirm_password}
    
    open page
    click Registration
    enter first_name_registration    ${first_name}
    enter last_name_registration    ${last_name}
    enter address_registration    ${address}
    enter city_registration    ${city}
    enter State_registration    ${state}
    enter zipcode_registration    ${zip}
    enter phone_registration    ${phone}
    enter ssn_registration    ${ssn}
    enter username_registration    ${user_name}
    enter password_registration    ${password}
    enter confirm_password_registration    ${confirm_password}
    click register
    validate new user
