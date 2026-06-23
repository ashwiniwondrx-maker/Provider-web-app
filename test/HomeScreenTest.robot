*** Settings ***
Resource    ../Keywords/CommonKeywords.robot
Resource    ../Keywords/OrderAcceptKeywords.robot

*** Test Cases ***

Login with OTP
    [Documentation]
    Open Web App
    Enter Six Digit OTP

Refresh order and tap on Accept order button
    [Documentation]  Refresh order and tap on Accept order button
    Refresh order and tap on Accept order button

Adding And Managing Lab Test
    [Documentation]    Verify user is able to add, edit, and delete lab test successfully.

    Adding And Managing Lab Test

#Add Schedule slot
  #[Documentation]     Adding schedule slot
   #Add Schedule slot

#Click on on patient details icon
 #   [Documentation]     Adding schedule slot
  #  Click on on patient details icon