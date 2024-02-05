*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}      https://automationplayground.com/crm/
${user}     Robert.Friman@iths.se
${pw}       123


*** Test Cases ***
Create user/
    [Documentation]     Create user
    [Tags]              user
    Set Selenium Speed    0.5

   Given user is at login page
   When you sign in     ${user}     ${pw}
   when you add user
   Then user should be created

*** Keywords ***
Given user is at login page
    Open Browser    browser=Chrome
    Go To           ${URL}

When you sign in
    [Arguments]     ${user}     ${pw}
    Click Link          //*[@id="SignIn"]
    Input Text         //*[@id="email-id"]    ${user}
    Input Password    //*[@id="password"]     ${pw}
    Click Button     //*[@id="submit-id"]

when you add user
    Click Link                        //*[@id="new-customer"]
    Input Text                       //*[@id="EmailAddress"]    ${user}
    Input Text                      //*[@id="FirstName"]        Karl
    Input Text                     //*[@id="LastName"]          Urban
    Input Text                    //*[@id="City"]               Los angeles
    Select From List By Index    //*[@id="StateOrRegion"]       5
    Click Button                //*[@id="loginform"]/div/div/div/div/form/div[6]/input[1]
    Click Button               //*[@id="loginform"]/div/div/div/div/form/div[7]/input
    Click Button              //*[@id="loginform"]/div/div/div/div/form/button

Then user should be created
     Wait Until Page Contains    Success! New customer added.


     yes this works

sdxdvx