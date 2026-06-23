*** Settings ***
Library    SeleniumLibrary
Resource    ../Locators/profilelocators.robot



*** Keywords ***
#Verify Profile
 [Documentation]
    ...    Verify provider profile details and order statistics.
    ...
    ...    Validation:
    ...    1. Navigate to the Profile section.
    ...    2. Verify the Profile page opens successfully.
    ...    3. Capture and display the Order Accepted statistics.
    ...    4. Verify profile details are displayed.
Verify profile
    Click Element    ${profile}
    Sleep    5s
    ${profileorder_stats}    Get Text    ${profileorder_stats}
    Log to console    order accepted:${profileorder_stats}
    Page Should Contain Element   ${deatil_profile}