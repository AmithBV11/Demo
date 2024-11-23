*** Settings ***

#run the script: robot -d results tests/crm1.robot
Resource   ../Resources/CRM.robot
Resource   ../Resources/Common.robot


#Runs before each test
Suite Setup         Insering test data

Test Setup    Open the browser
Test Teardown    close the browser

Suite Teardown    Cleanup test data

#runs before all test cases and after all test cases

*** Test Cases ***
#Test1
Customer login
    [Tags]    smoke
    set selenium speed        .2s
    set selenium timeout       5s

    CRM.Sign in

#Test2
Add new customer
    [Tags]    smoke
    set selenium speed        .2s
    set selenium timeout       5s

   # Common.Open the browser
    CRM.Sign in
    CRM.Add customer
    CRM.verify success
    #Common.close the browser


*** Keywords ***

