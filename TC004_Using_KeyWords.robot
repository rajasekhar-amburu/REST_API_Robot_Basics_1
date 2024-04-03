*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Resource  Resources/RequestKeywords.robot

*** Variables ***
${API_Base_Endpoint}    https://thetestingworldapi.com/

*** Test Cases ***
TC041_Get_Student_Details_and_Verify
    ${response1}=    Get Student Details and Return Response     /api/studentsDetails    10097304
    log to console  ${response1}

    ${response2}=    Get Student Details and Return Response     /api/studentsDetails    10097283
    log to console  ${response2}
