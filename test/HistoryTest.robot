*** Settings ***
Resource    ../Keywords/CommonKeywords.robot
Resource    ../Keywords/HistoryKeywords.robot

*** Test Cases ***

Login with OTP
    [Documentation]
    Open Web App
    Enter Six Digit OTP

Navigate to order history screen
    [Documentation]   Order history UI , searching orders by orderid and fetching the data according to the filter
    Navigate to order history screen


Verify Order History UI
   [Documentation]   Order history UI , searching orders by orderid and fetching the data according to the filter
    Verify Order History UI



  #Verify serach bar

Navigate to order in progress screen
  [Documentation]   Navigate to order in progress screen
  Navigate to order in progress screen

Adding And Managing Lab Test
  [Documentation]   Add lab test
  Adding And Managing Lab Test