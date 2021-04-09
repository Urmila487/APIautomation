*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  jsonLibrary





*** Variables ***
${URL}  https://reqres.in/api



*** Test Cases ***
TC_006 Get Request

    create session  Get_city_name   ${URL}
    ${response}=  get request  Get_city_name  /users/2
    #log to console  ${response.status_code}
    #log to console  ${response.content}
    #log to console  ${response.headers}

    ${status_code}=  convert to string  ${response.status_code}
    should be equal  ${status_code}  200

    ${body}=  convert to string  ${response.content}
    should contain  ${body}  Janet

    ${contenttypevalue}=  get from dictionary  ${response.headers}  Content-Type
    should be equal  ${contenttypevalue}  application/json; charset=utf-8

