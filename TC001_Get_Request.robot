*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${API_Base_Endpoint}    https://thetestingworldapi.com/

*** Test Cases ***
TC_001_Get_Request_Fetch_Status_Code
    create session          API_Session_Name1       ${API_Base_Endpoint}
    ${Get_Response}=        GET On Session          API_Session_Name1       api/studentsDetails/10097253
    log to console          ${Get_Response.status_code}
    ${str_stat_code}=       convert to string       ${Get_Response.status_code}
    log to console          ${Get_Response.content}
    should be equal         ${str_stat_code}        200

TC002_Validate_Response
    create session          API_Session_Name1       ${API_Base_Endpoint}
    ${Get_Response}=        GET On Session          API_Session_Name1       api/studentsDetails/10097253
    log to console          ${Get_Response.content}
    ${Json_Response}=       set variable            ${Get_Response.json()}
    log to console          ${Json_Response}
    @{first_name}=          get value from json     ${Json_Response}        data.first_name
    log to console          ${first_name}
    ${string_frist_name}=   get from list           ${first_name}           0
    log to console          ${string_frist_name}
    should be equal         ${string_frist_name}    sample string 3