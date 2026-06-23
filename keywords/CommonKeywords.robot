*** Settings ***

Library    SeleniumLibrary
Resource   ../Locators/CommonLocators.robot
Library    OperatingSystem
Variables  ../Config.py


*** Keywords ***

Open Web App
    [Documentation]    Open web app
    Open Browser    ${URL}    ${BROWSER}
    Maximize browser window
    Sleep    5
    Click Element   ${TXTMOBILENUMBER}
    Input Text  ${TXTMOBILENUMBER}     ${MOBILE_NUMBER}
   Click Element   ${TERMSANDCONDITION}
   #Run Keyword And Ignore Error    Hide Keyboard
   Click Element    ${GETOTP}

Enter Six Digit OTP
    [Documentation]    Type OTP from .env (default)
    Wait Until Element Is Visible    ${OTP1}    10s
    Sleep    5
    Input Text    ${OTP1}    ${OTP}[0]
    Input Text    ${OTP2}    ${OTP}[1]
    Input Text    ${OTP3}    ${OTP}[2]
    Input Text    ${OTP4}    ${OTP}[3]
    Input Text    ${OTP5}    ${OTP}[4]
    Input Text    ${OTP6}    ${OTP}[5]
   # Run Keyword And Ignore Error      Hide Keyboard
    Click element    ${VERIFYANDCONTINUE}
Verify Wondrx Home Loaded
    [Documentation]    Verify that home screen is visible
     Wait Until Page Contains element    ${WONDRXLOGO}     20s
    Log To Console    ✅ WONDRx Home Screen loaded successfully