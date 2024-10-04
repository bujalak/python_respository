from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn
from selenium.webdriver.common.devtools.v85.page import capture_screenshot


@library
class Shop:

   def __init__(self):
       self.sellib = BuiltIn().get_library_instance("SeleniumLibrary")
   @keyword
   def hello_world(self):
        print("Hii kiran")

   @keyword
   def add_items_to_cart(self, itemslist):
      producttitles= self.sellib.get_webelements("xpath://div[@class=\"inventory_item_name \"]")
      i=1
      for product in producttitles:
          if product.text in itemslist:
              self.sellib.click_button("(//div[@class=\"inventory_item_description\"])["+str(i)+"]//button")
          i=i+1
      #self.sellib.click_button("//a[@class='shopping_cart_link']")







