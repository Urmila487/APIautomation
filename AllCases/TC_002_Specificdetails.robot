*** Settings ***
Library  RequestsLibrary


*** Variables ***
${Base_URL}  http://thetestingworldapi.com/
${StudentID}  108513



*** Test Cases ***
TC_002_Fetch_Student_details_by_ID
    create session  FetchData   ${Base_URL}
    ${response}=  get request  FetchData  api/studentsDetails/${StudentID}
    ${actual_code}=  convert to string  ${response.status_code}
    should be equal  ${actual_code}  200
    #log to console  ${response.status_code}
    #log to console  ${response.content}
