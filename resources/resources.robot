*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Keywords ***
Open Browser and Maximize
    [Arguments]     ${Link}    ${ChosenBrowser}
    log    Starting test
    open browser    ${Link}    ${ChosenBrowser}
    maximize browser window

Close Browser Window
    log    Test is finished
    close browser

Login To Website
    [Arguments]     ${UserName}    ${UserPass}
    input text    id:user-name    ${UserName}
    input text    xpath://*[@id="password"]    ${UserPass}
    click button    name:login-button

Return Value Kwd
    ${ProductDescription}=    get text    xpath://*[@id="item_4_title_link"]/div
    [Return]    ${ProductDescription}
