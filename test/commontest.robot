*** Settings ***
Resource   ../keywords/commonkeywords.robot

*** Test Cases ***
 valid login test
      open login page
      Click mobile no
      Verify otp page
      Enetr otp
      Click verfiy button
