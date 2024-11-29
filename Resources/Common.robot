*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open the browser
    #open browser            https://automationplayground.com/crm/           chrome
    Open Browser  about:blank  chrome   options=--headless,--no-sandbox,--disable-dev-shm-usage
    #Open Browser  about:blank  chrome   options=add_argument("--headless --no-sandbox --disable-dev-shm-usage")
    #Open Browser  about:blank  chrome   options=add_argument("--headless") add_argument("--no-sandbox") add_argument("--disable-dev-shm-usage") add_argument("--user-data-dir=/tmp/chrome-user-data")
    #Open Browser  about:blank  chrome   options=--headless,--no-sandbox,--disable-dev-shm-usage,--user-data-dir=/tmp/chrome-user-data


close the browser
    close browser

Insering test data
    log    insering test data..

Cleanup test data
    log    cleanup test data..