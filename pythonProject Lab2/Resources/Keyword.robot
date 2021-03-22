*** Keywords ***
Begin Web Test
    Open browser                           about:blank   ${BROWSER}

Go to Web Page
    Load Page
    Verify Page Loaded

Load Page
    Go to                                  ${URL}

Verify Page Loaded
    ${link_text}                           Get Title
    Should Be Equal                        ${link_text}   Infotiv Car Rental

Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    Login Page

Input Username
    [Arguments]    ${username}
    wait until Page contains element    id:email
    Input Text     id:email    ${username}

Input Password
    [Arguments]    ${password}
    Input Text     id:password                ${password}

Submit Credentials
    Click Element    id:login



Input Pick-up date
    [Arguments]    ${pickupp}
    wait until Page contains element    id:start
    Input Text     id:start   ${pickupp}

Input Delivery date
    [Arguments]    ${Deliverydate}
    Input Text     id:end               ${Deliverydate}

Verify your trip
    ${back}                           Get Title
    Should Be Equal                        ${back}   https://rental32.infotiv.net/webpage/html/gui/showCars.php


Submit your trip
    Click Element    id:continue

Submit your car
     wait until Page contains element      id:bookModelXpass7
     Click Button                          id:bookModelXpass7

Welcome Page Should Be Open
    Page Should Contain   Infotiv Car Rental

Input CardNummer
    [Arguments]    ${Card_Nummer}
    wait until Page contains element    id:cardNum
    Input Text     id:cardNum   ${Card_Nummer}

Input FullName
    [Arguments]    ${fullName}
    Input Text     id:fullName               ${fullName}

Input Card cvc
     [Arguments]    ${Card_cvc}
     Input Text     id:cvc              ${Card_cvc}


Given that the user is logged in
    Click Element                           id:email
    Input Username                           ${user}
    Click Element                           id:password
    Input Password                          ${pass}
    Submit Credentials
    Wait until page contains                 You are signed in as wasim

When the user books a car
    Click Element                           id:start
    Input Pick-up date                      ${Pick-update}
    Click Element                           id:end
    Input Delivery date                     ${Deliverydate}
    Submit your trip
    wait until Page contains element        xpath://*[@id="ms-list-2"]/button

    click button                            xpath://*[@id="ms-list-2"]/button
    Select Checkbox                         id:ms-opt-8
    Click button                            xpath://*[@id="ms-list-1"]/button
    Select Checkbox                         id:ms-opt-3
    Wait until page contains element        id:carSelect1
    Click Element                           id:carSelect1
    Wait Until Page Contains                Confirm booking of Tesla Model X


    Click Element                         id:cardNum
    Input CardNummer                      ${Card_Nummer}
    Click Element                         id:fullName
    Input FullName                         ${fullName}
    Click Element                          id:cvc
    Input Card cvc                         ${Card_cvc}
    Click Element                          id:month7
    Click Element                          id:month2022
    Click Element                          id:confirm
    Wait until page contains                 A Tesla Model X is now ready for pickup 2021-04-10
Then car should be booked for the user
    Click element                           id:mypage
    Wait until page contains                My bookings
    Table Should Contain                    class:orderTable    Tesla
    Table Should Contain                    class:orderTable    Model X
    Table Should Contain                    class:orderTable    2021-04-10
    Table Should Contain                    class:orderTable    2021-04-28
    Click Button                            id:unBook1
    Alert Should Be Present
    Wait until page contains                 has been Returned
    Click Button                            id:mypage
    Wait until page contains                 You have no bookings



End Web Test
    Close Browser
