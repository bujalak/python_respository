*** Settings ***
Documentation     A resource file with all reusable components
Library     SeleniumLibrary
Library          Process


*** Variables ***
${user_name}  standard_user
${invalid_password}  gdal
${valid_password}  secret_sauce
${cart_element_present}   xpath=//a[@class='shopping_cart_link']
${url}  https://www.saucedemo.com

*** Keywords ***
Open the browser with the saucedemo url
    #Create Webdriver   chrome  executable_path=C:\\Users\\kiran\\Downloads\\chromedriver_win32 (6)\\chromedriver.exe
    #Go To  https://sso.teachable.com/secure/9521/identity/login/password

          ${result} =    Run Process    python    -c    "from webdriver_manager.chrome import ChromeDriverManager; print(ChromeDriverManager().install())"    stdout=output
        ${chrome_driver_path} =    Set Variable    ${result.stdout}

    Log    ChromeDriver Path: ${chrome_driver_path}
    Open Browser    ${url}  chrome    executable_path=${chrome_driver_path}
