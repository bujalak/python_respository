*** Settings ***
Documentation     A resource file with all checkout page object components
Library     SeleniumLibrary
Library          Process
Resource       Generic.robot

*** Keywords ***
Verify checkout items and proceed
    Click Element    xpath://a[@class='shopping_cart_link']
    Click Element    xpath://button[@id='checkout']