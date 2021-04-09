*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections


*** Variables ***
${Base_URL}  http://thetestingworldapi.com/



*** Test Cases ***
TC_005_Put_Request

    create session  AddData  ${Base_URL}
    ${body}=  create dictionary  id=108542  first_name=Ravindra  middle_name=Vadi  last_name=Ghadiya  date_of_birth=25Jan
    ${header}=  create dictionary  Content-Type=application/json

    ${response}=  put request  AddData  api/studentsDetails/108542  data=${body}   headers=${header}
    log to console  ${response.status_code}
    log to console  ${response.content}
    ${response1}=  get request  AddData  api/studentsDetails/108542
    log to console  ${response1.content}