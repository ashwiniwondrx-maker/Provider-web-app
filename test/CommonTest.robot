*** Settings ***
Resource    ../Keywords/CommonKeywords.robot


*** Test Cases ***
Login With OTP And Verify Home
    [Documentation]    Login in Consumer app and navigated to Home

     Open Web App
     Enter Six Digit OTP
     Verify Wondrx Home Loaded