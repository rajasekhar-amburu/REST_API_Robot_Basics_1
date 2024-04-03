*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${base_url}     https://thetestingworldapi.com/


*** Test Cases ***
TC031_POST_Method_Create_Entry
    create session      Session_Name1       ${base_url}
    &{headers}=         create dictionary   Content-Type=application/json
    &{payload}=         create dictionary   first_name=Rajasekhar     last_name=Amburu    date_of_birth=09-10-1991

    ${end_point}=       set variable        /api/studentsDetails
    ${response}=        post request        Session_Name1       ${end_point}        data=${payload}     headers=${headers}

    ${json_response}    to json             ${response.content}
    log to console      ${json_response}

    ${status_code}=     convert to string   ${response.status_code}
    log to console      ${status_code}
    should be equal     ${status_code}      201

TC032_GET_Method_To_Validate_POST
    create session      SessionName2        ${base_url}
    ${student_id}=      set variable        10097277
    ${end_point}=       set variable        /api/studentsDetails/${student_id}

    ${response}=        GET On Session      SessionName2        ${end_point}
    ${json_response}=   to json             ${response.content}
    log to console      ${json_response}

    @{lastname_list}=   get value from json  ${json_response}   data.last_name
    ${l_name}=          get from list       ${lastname_list}    0
    log to console      ${l_name}

    should be equal     ${l_name}           Amburu
