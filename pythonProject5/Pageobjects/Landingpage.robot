*** Settings ***
Documentation     A resource file with all landing page object components
Library     SeleniumLibrary
Library          Process
Resource       Generic.robot
*** Variables ***
${error_message_login}  xpath= //h3[@data-test='error']

*** Keywords ***
Fill the Login form
    [Arguments]     ${username}     ${password}
    Input Text         id:user-name   ${username}
    Input Password     id:password   ${password}
    Click Button       name:login-button

Wait until it checks and element is present

    Wait Until Locator Is Present       ${error_message_login}

Verify error message is correct
     ${result}=  Get Text   ${error_message_login}
     Should Be Equal As Strings    ${result}   Epic sadface: Username and password do not match any user in this service
