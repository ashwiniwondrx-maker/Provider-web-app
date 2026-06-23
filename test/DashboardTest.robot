*** Settings ***
Resource    ../Keywords/CommonKeywords.robot
Resource    ../Keywords/DashboardKeywords.robot


*** Test Cases ***
New orders
    [Documentation]   New order screen [Order aceept ,  reject flow]
     Open Web App
     Enter Six Digit OTP
     Verify Wondrx Home Loaded
     #Add test



