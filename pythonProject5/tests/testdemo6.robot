*** Settings ***

Documentation    To validate the login functionality
Test Setup    open the browser with the saucedemo url   #chromer
Resource     ../Pageobjects/Generic.robot
Resource       ../Pageobjects/Landingpage.robot
Resource      ../Pageobjects/Shoppage.robot
Resource      ../Pageobjects/checkoutpage.robot
Resource      ../Pageobjects/confirmationpage.robot


Library    SeleniumLibrary
Library      ../Customlibrary/Shop.py
Library       Collections
Library          Process

*** Variables ***
@{itemslist}    Sauce Labs Bolt T-Shirt  Sauce Labs Backpack
@{credinalslist}   kiran   kumar  516788


*** Test Cases ***
Validate the unsucessful login
    [Tags]    smoke
  Landingpage.Fill the login form  ${user_name}   ${invalid_password}
   Landingpage.Wait until it checks and element is present
    Landingpage.verify error message is correct
Validate the cards displayed in the shopping page
    [Tags]    regression
   Landingpage.Fill The Login Form  ${user_name}  ${valid_password}
     Shoppage.Wait until it checks and element is present
    Shoppage.verify titles cards in the home page
     select the card   Sauce Labs Fleece Jacket
     #sort the elements   Name (Z to A)
     Add Items To Cart    ${itemslist}

     checkoutpage.Verify checkout items and proceed
     confirmationpage.Verify the confirmation and finish   @{credinalslist}
     confirmationpage.Finish the setup