*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${API_Base_Endpoint}    https://reqres.in?page=2

*** Test Cases ***
TC011_Get_Request_With_Params
    Create Session      Session_Name_1      ${API_Base_Endpoint}
    ${endpoint}=        set variable            /api/users
    &{param}=           create dictionary       page=2
    ${response}=        GET On Session          Session_Name_1      ${endpoint}         params=${param}
    log to console      ${response.content}
    ${json_response}    to json  ${response.content}
    log to console      ${json_response}
    @{name_list}        get value from json     ${json_response}    data[0].first_name
    ${f_name}           get from list           ${name_list}        0
    log to console      ${f_name}
    should be equal     ${f_name}                Michael