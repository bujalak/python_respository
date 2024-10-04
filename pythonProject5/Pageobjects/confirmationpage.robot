*** Settings ***
Documentation     A resource file with all checkout page object components
Library     SeleniumLibrary
Library          Process
Resource       Generic.robot

*** Keywords ***
Verify the confirmation and finish
    [Arguments]    @{credinalslist}
    Input Text        xpath://input[@id='first-name']  ${credinalslist[0]}
    Input Text       xpath://input[@id='last-name']    ${credinalslist[1]}
    Input Text       xpath://input[@id='postal-code']   ${credinalslist[2]}
    Click Element    xpath://input[@id='continue']

Finish the setup
    Click Element     xpath://button[@id='finish']
    Page Should Contain    Thank you for your order!
