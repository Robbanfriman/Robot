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
    Set Selenium Speed    0
    Open Browser    browser=Chrome
    Go To    ${URL}

    signIN
    addUser
    Wait Until Page Contains    Success! New customer added.



*** Keywords ***
signIN
    Click Link    //*[@id="SignIn"]
    Input Text         //*[@id="email-id"]    ${user}
    Input Password    //*[@id="password"]    ${pw}
    Click Button    //*[@id="submit-id"]

addUser
    Click Link                        //*[@id="new-customer"]
    Input Text                       //*[@id="EmailAddress"]    ${user}
    Input Text                      //*[@id="FirstName"]    karl
    Input Text                     //*[@id="LastName"]    urban
    Input Text                    //*[@id="City"]    los angeles
    Select From List By Index    //*[@id="StateOrRegion"]   5
    Click Button                //*[@id="loginform"]/div/div/div/div/form/div[6]/input[1]
    Click Button               //*[@id="loginform"]/div/div/div/div/form/div[7]/input
    Click Button              //*[@id="loginform"]/div/div/div/div/form/button

