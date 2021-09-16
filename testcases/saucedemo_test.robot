*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/resources2.robot

*** Variables ***
# Browser Testing
${URL}    http://saucedemo.com
${Browser}    Chrome

#Login info
${StandardUser}    standard_user
${LockedOutUser}    locked_out_user
${ProblemUser}    problem_user
${PerformanceGlithcUser}    performance_glitch_user

${Password}    secret_sauce

*** Test Cases ***
Standard User Test Case
    [Setup]    Open Browser and Maximize    ${URL}    ${Browser}
    [Teardown]    Close Browser Window
    Login Attempt    ${StandardUser}    ${Password}
    Pick Product    xpath://*[@id="item_5_title_link"]/div    id:add-to-cart-sauce-labs-fleece-jacket
    Change Sorting    hilo
    Pick Product    xpath://*[@id="item_4_title_link"]/div  id:add-to-cart-sauce-labs-backpack
    Change Sorting    za
    Pick Product    xpath://*[@id="item_0_title_link"]/div    id:add-to-cart-sauce-labs-bike-light
    sleep    3
    Checkout Shopping Cart    Roman    Kutselepa    13625    3    97.17
    Logout Attempt

Locked User Test Case
    [Setup]    Open Browser and Maximize    ${URL}    ${Browser}
    [Teardown]    Close Browser Window
    Login Attempt    ${LockedOutUser}    ${Password}
    Pick Product    xpath://*[@id="item_5_title_link"]/div    id:add-to-cart-sauce-labs-fleece-jacket
    Change Sorting    hilo
    Pick Product    xpath://*[@id="item_4_title_link"]/div  id:add-to-cart-sauce-labs-backpack
    Change Sorting    za
    Pick Product    xpath://*[@id="item_0_title_link"]/div    id:add-to-cart-sauce-labs-bike-light
    sleep    3
    Checkout Shopping Cart    Roman    Kutselepa    13625    3    97.17
    Logout Attempt

Problem User Test Case
    [Setup]    Open Browser and Maximize    ${URL}    ${Browser}
    [Teardown]    Close Browser Window
    Login Attempt    ${ProblemUser}    ${Password}
    Pick Product    xpath://*[@id="item_5_title_link"]/div    id:add-to-cart-sauce-labs-fleece-jacket
    Change Sorting    hilo
    Pick Product    xpath://*[@id="item_4_title_link"]/div  id:add-to-cart-sauce-labs-backpack
    Change Sorting    za
    Pick Product    xpath://*[@id="item_0_title_link"]/div    id:add-to-cart-sauce-labs-bike-light
    sleep    3
    Checkout Shopping Cart    Roman    Kutselepa    13625    3    97.17
    Logout Attempt

Glithc User Test Case
    [Setup]    Open Browser and Maximize    ${URL}    ${Browser}
    [Teardown]    Close Browser Window
    Login Attempt    ${PerformanceGlithcUser}    ${Password}
    Pick Product    xpath://*[@id="item_5_title_link"]/div    id:add-to-cart-sauce-labs-fleece-jacket
    Change Sorting    hilo
    Pick Product    xpath://*[@id="item_4_title_link"]/div  id:add-to-cart-sauce-labs-backpack
    Change Sorting    za
    Pick Product    xpath://*[@id="item_0_title_link"]/div    id:add-to-cart-sauce-labs-bike-light
    sleep    3
    Checkout Shopping Cart    Roman    Kutselepa    13625    3    97.17
    Logout Attempt