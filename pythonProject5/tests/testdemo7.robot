*** Settings ***
Documentation    to test the dictionary elements
Library    Collections
Library    RequestsLibrary

*** Variables ***
${base_url}  https://rahulshettyacademy.com
${book_msg}
*** Test Cases ***

play around with the dictionary
      &{data}=  Create dictionary  name=kiran  id =123
      Log To Console      ${data}
      Dictionary Should Contain Key    ${data}  name


Add book into library database
    &{res_body}=  Create Dictionary    name=learn api with robot  isbn=677  aisle=9088  author=kiran
   ${response}=   POST       ${base_url}/Library/Addbook.php     json=${res_body}     expected_status=200
   Log To Console    ${response.json()}
   Dictionary Should Contain Key    ${response.json()}   ID 
   ${book_msg}   Get From Dictionary    ${response.json()}  ID
   Set Global Variable    ${book_msg}
   Log To Console    ${book_msg}
   Log To Console    ${response.json()}[Msg]

Get the book details by id
    ${get_reponse}=   GET     ${base_url}/Library/Addbook.php     params=ID=${book_msg}     expected_status =200
    Log To Console    ${get_reponse.json()}
