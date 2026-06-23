*** Settings ***
Resource    ../keywords/orderhistorykeywords.robot

*** Test Cases ***
 valid order history page
    Add Refill reminder
    Verify order history dashboard
    Verify notify care executive
    Verify Upload invoice