*** Settings ***

Documentation    To validate the login functionality
Test Setup    open the browser with the saucedemo url
Resource     resource.robot
Library       SeleniumLibrary
Library       Collections
Library          Process

*** Variables ***
${error_message_login}  xpath= //h3[@data-test='error']

*** Test Cases ***
#Validate the unsucessful login
  #  Fill the login form  ${user_name}   ${invalid_password}
   # Wait until it checks and element is present  ${error_message_login}
    #verify error message is correct
Validate the cards displayed in the shopping page
    Fill The Login Form  ${user_name}  ${valid_password}
     #Wait until it checks and element is present  ${cart_element_present}
    # verify titles cards in the home page
     #select the card   Sauce Labs Fleece Jacket
     sort the elements   Name (Z to A)

*** Keywords ***

       # Open Browser    https://sso.teachable.com/secure/9521/identity/login/password   # chrome    executable_path=C:/Users/kiran/Downloads/chromedriver_win32 (6)/chromedriver.exe

Fill the Login form
    [Arguments]     ${username}     ${password}
    Input Text         id:user-name   ${username}
    Input Password     id:password   ${password}
    Click Button       name:login-button


Wait until it checks and element is present
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}


Verify error message is correct
     ${result}=  Get Text   ${error_message_login}
     Should Be Equal As Strings    ${result}   Epic sadface: Username and password do not match any user in this service


Verify titles cards in the home page
    @{expectedList}=  Create List  =  Sauce Labs Backpack  Sauce Labs Bike Light   Sauce Labs Bolt T-Shirt   Sauce Labs Fleece Jacket  Sauce Labs Onesie   Test.allTheThings() T-Shirt (Red)
     ${elements} =   Get WebElements   xpath://div[@class="inventory_item_name "]
     @{actuallist} =  Create List
     FOR    ${element}    IN     @{elements}
         Log   ${element.text}
         Append To List    ${actuallist}  ${element.text}

      END

      #Lists Should Be Equal  ${expectedList}  ${actuallist}
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
        
Sort the elements 
    [Arguments]    ${sortorder}
     Select From List By Label    xpath://select[@class="product_sort_container"]   ${sortorder}
     @{sorted_list}   Get Webelements      xpath://div[@class="inventory_item_name "]
     @{created_list}  Create List   Test.allTheThings() T-Shirt (Red)  Sauce Labs Onesie  Sauce Labs Fleece Jacket  Sauce Labs Bolt T-Shirt  Sauce Labs Bike Light  Sauce Labs Backpack
     @{expected_list}   Create List
     FOR    ${ele}  IN   @{sorted_list}
         Log To Console    ${ele.text}
        

         Append To List    ${expected_list}  ${ele.text}
     END

     #${length}   Get Length    ${sorted_list}
    # Log To Console    ${length}

     Lists Should Be Equal    ${expected_list}  ${created_list}

     






