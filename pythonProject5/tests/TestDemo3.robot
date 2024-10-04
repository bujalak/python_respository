*** Settings ***

Documentation    To validate the login functionality
Library       SeleniumLibrary
Library          Process
Test Template    Validate the unsuccessful login

*** Variables ***
${error_message_login}  //h3[@data-test='error']

*** Test Cases ***   username  password
Invalid username     vdgvce    ydgdygdy
Invalid password     dvwg       dwdbh
Special characters   6677       5677r

#Validate the unsucessful login
 #   open the browser with the rahulshetty url
  #  Fill the login form
   # wait until it checks and display the error message
    #verify error message is correct

*** Keywords ***

Validate the unsuccessful login
    [Arguments]    ${username}  ${password}
    open the browser with the saucedemo url
    Fill the login form   ${username}  ${password}
    wait until it checks and display the error message
    verify error message is correct

Open the browser with the saucedemo url
    #Create Webdriver   chrome  executable_path=C:\\Users\\kiran\\Downloads\\chromedriver_win32 (6)\\chromedriver.exe
    #Go To  https://sso.teachable.com/secure/9521/identity/login/password

       ${result} =    Run Process    python    -c    "from webdriver_manager.chrome import ChromeDriverManager; print(ChromeDriverManager().install())"    stdout=output
        ${chrome_driver_path} =    Set Variable    ${result.stdout}

    Log    ChromeDriver Path: ${chrome_driver_path}
    Open Browser    https://www.saucedemo.com   chrome    executable_path=${chrome_driver_path}

       # Open Browser    https://sso.teachable.com/secure/9521/identity/login/password   # chrome    executable_path=C:/Users/kiran/Downloads/chromedriver_win32 (6)/chromedriver.exe

Fill the login form
    [Arguments]    ${username}   ${password}
    Input Text         id:user-name   ${username}
    Input Password     id:password    ${password}
    Click Button       name:login-button


Wait until it checks and display the error message
    Wait Until Element Is Visible    ${error_message_login}


Verify error message is correct
     ${result}=  Get Text   ${error_message_login}
     Should Be Equal As Strings    ${result}   Epic sadface: Username and password do not match any user in this service







