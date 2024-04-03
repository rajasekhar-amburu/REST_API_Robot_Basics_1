*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections


*** Variables ***
${default_base_url}     https://thetestingworldapi.com/


*** Keywords ***
Get Student Details and Return Response
    [Arguments]         ${end_point}        ${student_id}
    create session      SessionName1        ${default_base_url}
    ${end_point}=       set variable        ${end_point}/${student_id}

    ${response}=        GET On Session      SessionName1        ${end_point}
    ${json_response}=   to json             ${response.content}
    [Return]            ${json_response}
