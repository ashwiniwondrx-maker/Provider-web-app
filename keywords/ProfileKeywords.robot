*** Settings ***

Library  SeleniumLibrary
Resource   ../Locators/CommonLocators.robot
Resource   ../Locators/ProfileLocators.robot
Library  OperatingSystem
Library    DateTime
Variables  ../Config.py

*** Keywords ***

Verify Prfoile screen UI
  [Documentation]  Checks if all profile icons are displayed and logs results
  ${elements}=  Create list
  ...   ${PROFILEIMG}
  ...   ${PROFILENAME}
  ...   ${PROFILEMOBNUMBER}
  ...   ${ORDERSTATSGRAPH}
  ...   ${OWNERROLE}
  ...   ${ORDERACCEPTEDCARD}
  ...   ${REVENUECREATEDCARD}

  
   Log To Console    \nVerifying all Dashboard elements...
    FOR    ${element}    IN    @{elements}
        ${status}    ${msg}=    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${element}    10s
        Run Keyword If    '${status}'=='PASS'    Log To Console    ✅ ${element} visible
        Run Keyword If    '${status}'=='FAIL'    Log To Console    ❌ ${element} missing
    END
Navigate to profile screen
   [Documentation]   Navigate to profile screen
   Wait Until Element Is Visible    ${NAVIGATETOPROFILE}  10s
   Click Element    ${NAVIGATETOPROFILE}

Navigate to logout screen
    [Documentation]    Navigate to logout screen 
    Click Element    ${logout}
    Click Element    ${LEAVE_ANYWAY}


