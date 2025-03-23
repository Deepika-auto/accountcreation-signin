*** Settings ***
Library    SeleniumLibrary
Resource             ../testcase/testcases.robot
Resource             ../variables/Variable.robot

*** Keywords ***
Creating Account with both postive and negative scenarios
    [Arguments]    ${firstname}    ${lastname}    ${mailid}    ${password}    ${confirmation_password}    ${expected_result}
    Open Browser        ${website_url}        gc
    Maximize Browser Window
    Click Element        (//*[@href="https://magento.softwaretestingboard.com/customer/account/create/"])[1]
    Wait Until Page Contains        Create New Customer Account
    Input Text        //input[@id="firstname"]        ${firstname}
    Input Text        //input[@id="lastname"]        ${lastname}
    Input Text        //input[@name="email"]        ${mailid}
    Input Text        //input[@id="password"]        ${password}
    Input Text        //input[@id="password-confirmation"]        ${confirmation_password}
    Click Button        //button[@type='submit' and @title='Create an Account']
    Wait Until Element Is Visible        ${expected_result}
    Close Browser

Signing to the website with both positive and negative credentials
    [Arguments]    ${username}    ${user_password}    ${expected_result}
    Open Browser        ${website_url}        gc
    Maximize Browser Window
    Click Element        (//a[contains(@href, '/customer/account/login') and contains(text(), 'Sign In')])[1]
    Wait Until Page Contains        Customer Login
    Input Text        //input[@id="email"]        ${username}
    Input Text        //input[@id="pass"]        ${user_password}
    Click Element        (//*[@type="submit" and span[text()='Sign In']])[1]
    Wait Until Element Is Visible    ${expected_result}
    Close Browser
    
Create an account and signin with the same account
    [Arguments]    ${firstname}    ${lastname}    ${mailid}    ${password}    ${confirmation_password}    ${expected_a/c_result}        ${username}        ${user_password}        ${expected_sign_result}
    Open Browser        ${website_url}        gc
    Maximize Browser Window
    Click Element        (//*[@href="https://magento.softwaretestingboard.com/customer/account/create/"])[1]
    Wait Until Page Contains        Create New Customer Account
    Input Text        //input[@id="firstname"]        ${firstname}
    Input Text        //input[@id="lastname"]        ${lastname}
    Input Text        //input[@name="email"]        ${mailid}
    Input Text        //input[@id="password"]        ${password}
    Input Text        //input[@id="password-confirmation"]        ${confirmation_password}
    Click Button        //button[@type='submit' and @title='Create an Account']
    Wait Until Element Is Visible        ${expected_a/c_result}
    Click Element        (//button[@class="action switch"])[1]
    Wait Until Page Contains                Sign Out
    Click Element        (//a[@href="https://magento.softwaretestingboard.com/customer/account/logout/"])[1]
    Wait Until Page Contains        You are signed out
    Click Element        (//a[contains(@href, '/customer/account/login') and contains(text(), 'Sign In')])[1]
    Wait Until Page Contains        Customer Login
    Input Text        //input[@id="email"]        ${username}
    Input Text        //input[@id="pass"]        ${user_password}
    Click Element        (//*[@type="submit" and span[text()='Sign In']])[1]
    Wait Until Element Is Visible    ${expected_sign_result}
    Close Browser
