*** Settings ***
Library           RequestsLibrary

*** Variables ***
${BASE_URL}      https://jsonplaceholder.typicode.com

*** Test Cases ***
Get Users Test
    [Documentation]    Test to get users from API
    Create Session    mysession    ${BASE_URL}
    ${response}=    Get Request    mysession    /users
    Should Be Equal As Numbers    ${response.status_code}    200