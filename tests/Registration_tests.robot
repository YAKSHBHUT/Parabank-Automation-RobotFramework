*** Settings ***
Resource    ../resources/registration.robot
Suite Setup       Open Browser To Registration Page
Suite Teardown    Close Browser

*** Test Cases ***
registration
    register new user    Yaksh    Bhut    332 West 5th street    Hamilton    Ontario    L9C3P3    3658834261    yb    yaksh@06    Yaksh@1234    Yaksh@1234