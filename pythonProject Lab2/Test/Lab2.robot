
*** Settings ***
Documentation       This is some basic info about the whole test suite.
Resource            ../Resources/Keyword.robot
Library             SeleniumLibrary
Test Setup           Begin Web Test
Test Teardown        End Web Test

*** Variables ***
${BROWSER}        chrome
${URL}            https://rental32.infotiv.net/
${LOGIN URL}
${user}           wassimeljomaa@gmail.com
${pass}           Eva%eva1407
${feluser}        jhc<c<@hotmail.com
${felpass}        jhlgfasds
${Pick-update}     04-10
${Deliverydate}    04-28
${feldate}         02-12
${Card_Nummer}     1234567890123456
${fullName}        Wasim El-jomaa
${Card_cvc}        876
#**********************************************************************************
*** Test Cases ***

Valid Login
    [Documentation]                          This test checks if login functions works with valid credentials
    [Tags]                                   teststValidLogin
    Go to Web Page
    Click Element                           id:email
    Input Username    ${user}
    Click Element                           id:password
    Input Password    ${pass}
    Submit Credentials
    Wait until page contains                You are signed in as wasim
    Click Element                           id:logout
    Wait until page contains element        id:login

#*****************************************************************************
Invalid Login - Wrong username and password
    [Documentation]                          This test checks if login functions works with the wrong credentials
    [Tags]                                   testInvalidLogin 1
    Go to Web Page
    Click Element                           id:email
    Input Username                          ${feluser}
    Click Element                           id:password
    Input Password                          ${felpass}
    Submit Credentials
    Element Should Be Visible               id:signInError
#***************************************************************************

Invalid login - Right username and wrong password
    [Documentation]                          This test checks if login functions works with the wrong credentials
    [Tags]                                   testInvalidLogin 2
    Go to Web Page
    Click Element                           id:email
    Input Username                          ${user}
    Click Element                           id:password
    Input Password                          ${felpass}
    Submit Credentials
    Element Should Be Visible               id:signInError
#********************************************************************************

Invalid login - Wrong username and right password
    [Documentation]                          This test checks if login functions works with the wrong credentials
    [Tags]                                   testInvalidLogin 3
    Go to Web Page
    Click Element                           id:email
    Input Username                          ${feluser}
    Click Element                           id:password
    Input Password                          ${pass}
    Submit Credentials
    Element Should Be Visible               id:signInError
#*********************************************************************************


User can access website and show available cars
    [Documentation]                        This tests the availabilty of cars
    [Tags]                                 testsValidBookningDate 1
    Go to Web Page
    Click Element                           id:start
    Input Pick-up date                      ${Pick-update}
    Click Element                           id:end
    Input Delivery date                     ${Deliverydate}
    Submit your trip
    wait until page contains                 What would you like to drive?
#***********************************************************************************

Test wrong start date and correct end date on booking site
    [Documentation]                        This tests the wrong start date but with the correct end date when booking a car
    [Tags]                                 testsInvalidBookningDate 1
    Go to Web Page
    Click Element                           id:start
    Input Pick-up date                      ${feldate}
    Click Element                           id:end
    Input Delivery date                     ${Deliverydate}
    Submit your trip
    wait until element is visible            css:#start:invalid
#*********************************************************************************

Test correct start date and wrong end date on booking site
    [Documentation]                        This tests the correct start date but with the wrong end date when booking a car
    [Tags]                                 testsInvalidBookningDate 2
    Go to Web Page
    Click Element                           id:start
    Input Pick-up date                      ${Pick-update}
    Click Element                           id:end
    Input Delivery date                     ${feldate}
    Submit your trip
    wait until element is visible            css:#end:invalid
#*********************************************************************************

Test that user can go through the whole booking flow
    [Documentation]                        This tests the whole booking flow
    [Tags]                                 VG_Test
    Go to Web Page
    Given that the user is logged in
    When the user books a car
    Then car should be booked for the user










