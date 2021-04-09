*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections


*** Variables ***
${Base_URL}  http://thetestingworldapi.com/

*** Test Cases ***
TC_004_DeleteRequests

    create session  AppAccess  ${Base_URL}
    ${response}=  delete request  AppAccess  /api/studentsDetails/108534
    ${code}=  convert to string  ${response.status_code}
    should be equal  ${code}  200
    ${jsonresponse}=  To json  ${response.content}
    ${status_list}=  get value from json  ${jsonresponse}  status  0
    ${status}=  get from list  ${status_list}
    should be equal  ${status}  true

    #log to console  ${response.status_code}
    #log to console  ${response.content}