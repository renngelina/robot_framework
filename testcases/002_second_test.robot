*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/resources.robot

*** Variables ***
${URL}    http:saucedemo.com
${Browser}    Chrome
# User password
${Password}    secret_sauce
# Different users
${StdUser}    standard_user
${LckdUser}    locked_out_user
${PrblmUser}    problem_user
${PrGlitchUser}    performance_glitch_user

*** Test Cases ***
Locked User Automated Test
    Open Browser and Maximize    ${URL}    ${Browser}
    Login To Website    ${LckdUser}    ${Password}
    IF    element should contain    xpath://*[@id="header_container"]/div[2]/span    PRODUCTS
    fail    Login attempt failed with user ${LckdUser}
    Close Browser Window
    sleep    3
    Close Browser Window

Standard User Automated Test
    Open Browser and Maximize    ${URL}    ${Browser}
    Login To Website    ${StdUser}    ${Password}
    sleep    3
    element should contain    xpath://*[@id="header_container"]/div[2]/span    PRODUCTS
    ${Location}=    get location
    Log  ${Location}
    ${Title}=    get text
    log    ${Title}
    ${Time}=    get time
    log    ${Time}
    go back
    sleep    3
    Close Browser Window