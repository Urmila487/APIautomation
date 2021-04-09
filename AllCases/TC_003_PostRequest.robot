*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections


*** Variables ***
${Base_URL}  http://thetestingworldapi.com/



*** Test Cases ***
TC_003_Post_Response

    create session  AddData  ${Base_URL}
    ${body}=  create dictionary  first_name=Urmila  middle_name=Vadi    last_name=Ghadiya   date_of_birth=25Jan
    ${header}=  create dictionary  Content-Type=application/json


    ${response}=  post request  AddData  api/studentsDetails    data=${body}   headers=${header}
    ${code}=  convert to string  ${response.status_code}
    should be equal  ${code}  201
    log to console  ${response.status_code}
    log to console  ${response.content}