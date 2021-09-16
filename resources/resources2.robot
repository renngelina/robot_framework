*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Browser and Maximize
    [Arguments]    ${WebsiteLink}    ${BrowserName}
    log    Starting test with ${WebsiteLink} and ${BrowserName} browser.
    open browser    ${WebsiteLink}    ${BrowserName}
    maximize browser window
    ${Title}=    get title
    log    ${Title}

Close Browser Window
    log    Finished testing.
    close browser

Login Attempt
    [Arguments]    ${Login}    ${Pass}
    input text    id:user-name    ${Login}
    input text    id:password    ${Pass}
    click button    id:login-button
    sleep    3
    page should not contain element    x-path://*[@id="login_button_container"]/div/form/div[3]/h3

Logout Attempt
    click button    id:react-burger-menu-btn
    wait until element is visible    id:logout_sidebar_link
    click link    id:logout_sidebar_link

Pick Product
    [Arguments]    ${ProductNameIdentifier}    ${AddProductIdentifier}
    ${ProductName}=    get text    ${ProductNameIdentifier}
    log    ${ProductName}
    click button    ${AddProductIdentifier}

Change Sorting
    [Arguments]    ${SortingValue}
    select from list by value    xpath://*[@id="header_container"]/div[2]/div[2]/span/select    ${SortingValue}

Checkout Shopping Cart
    [Arguments]    ${Name}    ${SurName}    ${ZIP}    ${Count}    ${CheckSum}
    element should contain    xpath://*[@id="shopping_cart_container"]/a/span    3
    click link    xpath://*[@id="shopping_cart_container"]/a
    set screenshot directory    screenshots
    capture element screenshot    xpath://*[@id="cart_contents_container"]/div/div[1]
    click button    xpath://*[@id="checkout"]
    input text    id:first-name    ${Name}
    input text    id:last-name    ${Surname}
    input text    id:postal-code    ${ZIP}
    click button    id:continue
    capture element screenshot    xpath://*[@id="checkout_summary_container"]/div/div[2]
    element should contain    xpath://*[@id="checkout_summary_container"]/div/div[2]/div[7]    ${CheckSum}
    click button    id:finish
    click button    id:back-to-products

