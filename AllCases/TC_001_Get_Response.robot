*** Settings ***
Library  RequestsLibrary


*** Variables ***
${Base_URL}  http://thetestingworldapi.com/



*** Test Cases ***
TC_001_Get_Response

    create session  Get_student_details  ${Base_URL}
    ${response} =  get request  Get_student_details  api/studentsDetails
    log to console  ${response.status_code}
    log to console  ${response.content}
    log to console  ${response.headers}
