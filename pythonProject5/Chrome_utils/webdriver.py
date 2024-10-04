from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
from robot.libraries.BuiltIn import BuiltIn

def create_chrome_browser():
    driver = webdriver.Chrome(ChromeDriverManager().install())
    seleniumlib = BuiltIn().get_library_instance('SeleniumLibrary')
    seleniumlib.register_driver(driver, 'chrome')
