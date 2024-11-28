*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open the browser
    #open browser            https://automationplayground.com/crm/           chrome
    Open Browser  about:blank  chrome



close the browser
    close browser

Insering test data
    log    insering test data..

Cleanup test data
    log    cleanup test data..