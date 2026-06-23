*** Settings ***
Library    SeleniumLibrary
Resource    ../Locators/rLogoutlocator.robot

*** Keywords ***
#  Logout from application
 [Documentation]
    ...    Verify logout functionality.
    ...    Validation:
    ...    1. Logout option is visible
    ...    2. Logout confirmation popup appears
    ...    3. User exits application successfully

verify logout
    Sleep    5s
    Click Element    ${logout}
    Click Element    ${leave}
