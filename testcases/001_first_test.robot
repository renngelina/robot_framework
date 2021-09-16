*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${URL}    http://www.saucedemo.com
${Browser}    Chrome

*** Test Cases ***
Robot First Test Case
    # open browser will open browser window
    open browser    ${URL}    ${Browser}
    maximize browser window
    input text    id=user-name    standard_user
    ${TestVar}=    get text    id=login_credentials
    log    ${TestVar}
    sleep    4
    clear element text    id:user-name
    sleep    4
    input text    id:user-name    problem_user
    input text    xpath:/html/body/div/div/div[2]/div[1]/div[1]/div/form/div[2]/input    secret_sauce
    click button    name:login-button
    sleep    4
    close browser
