*** Settings ***
Documentation     A resource file with all shop page object components
Library     SeleniumLibrary
Library          Process
Resource      Generic.robot


*** Variables ***
${cart_element_present}   xpath=//a[@class='shopping_cart_link']


*** Keywords ***
Wait until it checks and element is present
    Wait Until Locator Is Present   ${cart_element_present}


Verify titles cards in the home page
    @{expectedList}=  Create List  =  Sauce Labs Backpack  Sauce Labs Bike Light   Sauce Labs Bolt T-Shirt   Sauce Labs Fleece Jacket  Sauce Labs Onesie   Test.allTheThings() T-Shirt (Red)
     ${elements} =   Get WebElements   xpath://div[@class="inventory_item_name "]
     @{actuallist} =  Create List
     FOR    ${element}    IN     @{elements}
         Log   ${element.text}
         Append To List    ${actuallist}  ${element.text}

      END
select the card
    [Arguments]    ${card name}
    ${elements}   Get Webelements    xpath://div[@class="inventory_item_name "]
    ${index}=   Set Variable    1
    FOR    ${element}  IN   @{elements}
        Exit For Loop If    '${card name}' =='${element.text}'
        ${index}=   Evaluate    ${index}+1


        END
        Log To Console    ${index}
        Click Button    (//div[@class="inventory_item_description"])[${index}]//button

