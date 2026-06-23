*** Settings ***
Resource    ../Keywords/CommonKeywords.robot
Resource    ../Keywords/OrderAcceptKeywords.robot
Resource    ../Keywords/HistoryKeywords.robot
Resource    ../Keywords/ProfileKeywords.robot

*** Test Cases ***
Verify Prfoile screen UI
    [Documentation]   Verifying profie screen UI
  Open Web App
  Enter Six Digit OTP
  Navigate to profile screen
  Verify Prfoile screen UI
  Navigate to logout screen