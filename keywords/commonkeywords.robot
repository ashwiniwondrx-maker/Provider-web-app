*** Settings ***
Library   SeleniumLibrary
Resource    ../Locators/commonlocators.robot


*** Keywords ***
#opening the appication
open login page
  Open Browser  https://test-provider.wondrx.info/login   Chrome
  Maximize Browser Window
#Enter the mobile no.
Click mobile no
    Click Element  ${Entermobileno}
    Input Text    ${Entermobileno}     1234567890
    Click Element    ${privacypolicy}
    Page Should Contain Element    ${getotp}
    Click Element    ${getotp}
#Verify otp page
Verify otp page
    Wait Until Element Is Visible    ${verfiymobileno}
    Page Should Contain    We've sent a 6-digit code to
    Element Should Be Visible    ${verfiyandcontinue}

#Enter the otp
Enetr otp
    Input Text    ${enterotp}      123456789
#confirm
Click verfiy button
    Page Should Contain Element    ${verfiyandcontinue}
    Click Element    ${verfiyandcontinue}










