*** Settings ***
Library    SeleniumLibrary
Resource  ../Resources/PO/LandingPage.robot

*** Keywords ***
Sign in
    LandingPage.Load
    LandingPage.Verify Page Loaded


      click link    css=#SignIn

    sleep                   3s
    page should contain   Login

    input text              id=email-id         admin@robotframeworktutorial.com
    input text              id=password       qwe
    click button            Submit

    wait until page contains    Our Happy Customers
Add customer
    click link    New Customer


    wait until page contains    Add Customer
    input text              id=EmailAddress       amithbv@gmail.com
    input text              id=FirstName       Amith
    input text              id=LastName       BV
    input text              id=City       Bangalore

    select from list by value    id=StateOrRegion   NY
    select radio button          gender   male
    select checkbox              name=promos-name

    click button                Submit
verify success
    wait until page contains    Success! New customer added.
    sleep   5s
