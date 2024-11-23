*** Settings ***
Library    SeleniumLibrary


*** Keywords ***

Load
    Go to    https://automationplayground.com/crm/
    maximize browser window

Verify Page Loaded
    wait until page contains    Customers Are Priority One!





