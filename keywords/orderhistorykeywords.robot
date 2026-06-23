*** Settings ***
Library    SeleniumLibrary
Resource    ../Locators/orderhistorylocators.robot
Library    String
Library    DateTime
Library    Process

*** Keywords ***

#Verify the add refill reminder and edit refill reminder
 [Documentation]
    ...    Verify add and edit refill reminder functionality.
    ...    Validation:
    ...    1. Open order history
    ...    2. Select completed/assigned order
    ...    3. Open refill reminder popup
    ...    4. Select medicines
    ...    5. Set date and future time
    ...    6. Save refill reminder
    ...    7. Edit refill reminder
    ...    8. Verify updated reminder

Add Refill reminder
    Sleep    5s
    Click Element    ${order_history}
    ${is_present4}=    Run Keyword And Return Status   Element Should Be Visible    ${order_card}    5s
    IF    ${is_present4}
    Sleep    2s
    ${order_card}=    Set Variable    //div[contains(@class,'card')]//span[text()='Delivery Boy Assigned']/ancestor::div[contains(@class,'card')]
    Wait Until Element Is Visible    ${order_card}
    Scroll Element Into View    xpath=//span[text()='Delivery Boy Assigned']/ancestor::div[contains(@class,'card')]
    Click Element    ${order_card}
    Sleep    5s
    Execute JavaScript    window.scrollBy(0,1500)
    Sleep    5s
     ${add_exists}=    Run Keyword And Return Status    Element Should Be Visible    ${Add_Refill_reminder}
     IF    ${add_exists}
        Log To Console    Found Add Refill Reminder button
        Click Element    ${Add_Refill_reminder}
         sleep    2s
    Click Element    ${selectall}
    Sleep    2s
     Click Element    ${set_reminder}
     Sleep    3s
     # Open calendar
    ${today}=    Get Current Date    result_format=%d-%m-%Y

    Click Element    xpath=//input[@type='date']

    Press Keys    xpath=//input[@type='date']    CTRL+a+BACKSPACE
    Press Keys    xpath=//input[@type='date']    ${today}

    # Get current datetime + 15 mins
    ${future_time}=
    ...    Evaluate
    ...    (datetime.datetime.now() + datetime.timedelta(minutes=15)).strftime("%H:%M")
    ...    modules=datetime

    Log To Console    ${future_time}
    Click Element    xpath=//input[@type='time']
    Press Keys    xpath=//input[@type='time']    CTRL+a+BACKSPACE

    # Input new time
    Press Keys    xpath=//input[@type='time']    ${future_time}
    Click Element    ${confirm_reminder}
    Sleep    5s
    Scroll Element Into View    ${Edit_Refill_reminder}
    Wait Until Element Is Visible    ${Edit_Refill_reminder}    timeout=10s
    Element Should Contain    ${Edit_Refill_reminder}   Edit Refill Reminder

    Click Element    ${Edit_Refill_reminder}
         sleep    2s
     Click Element    ${set_reminder}
     Sleep    3s
     # Open calendar
    ${today}=    Get Current Date    result_format=%d-%m-%Y

    Click Element    xpath=//input[@type='date']

    Press Keys    xpath=//input[@type='date']    CTRL+a+BACKSPACE
    Press Keys    xpath=//input[@type='date']    ${today}

    # Get current datetime + 15 mins
    ${future_time}=
    ...    Evaluate
    ...    (datetime.datetime.now() + datetime.timedelta(minutes=15)).strftime("%H:%M")
    ...    modules=datetime

    Log To Console    ${future_time}

    # Click time field
    Click Element    xpath=//input[@type='time']

    # Clear existing value
    Press Keys    xpath=//input[@type='time']    CTRL+a+BACKSPACE

    # Input new time
    Press Keys    xpath=//input[@type='time']    ${future_time}
    Click Element    ${confirm_reminder}
    Sleep    10s
    Scroll Element Into View    ${back}
    Click Element    ${back}
    Click Element    ${back_home}
    Sleep    2s
     ELSE
     Scroll Element Into View    ${Edit_Refill_reminder}
        Log To Console    Found Edit Refill Reminder button
        # Assertion: check that success message or updated button appears
    Wait Until Element Is Visible    ${Edit_Refill_reminder}    timeout=10s
    Element Should Contain    ${Edit_Refill_reminder}   Edit Refill Reminder
        Click Element    ${Edit_Refill_reminder}
         sleep    2s
     Click Element    ${set_reminder}
     Sleep    3s
     # Open calendar
    ${today}=    Get Current Date    result_format=%d-%m-%Y

    Click Element    xpath=//input[@type='date']

    Press Keys    xpath=//input[@type='date']    CTRL+a+BACKSPACE
    Press Keys    xpath=//input[@type='date']    ${today}

    # Get current datetime + 15 mins
    ${future_time}=
    ...    Evaluate
    ...    (datetime.datetime.now() + datetime.timedelta(minutes=15)).strftime("%H:%M")
    ...    modules=datetime

    Log To Console    ${future_time}

    # Click time field
    Click Element    xpath=//input[@type='time']

    # Clear existing value
    Press Keys    xpath=//input[@type='time']    CTRL+a+BACKSPACE

    # Input new time
    Press Keys    xpath=//input[@type='time']    ${future_time}
    Click Element    ${confirm_reminder}
    Sleep    10s
    Scroll Element Into View    ${back}
    Click Element    ${back}
    END

    ELSE
    Log To Console    No order present with "Delivery boy assigend " status
    END

#    Verify Order History Dashboard
    [Documentation]
    ...    Verify the Order History dashboard counts.
    ...    Validation:
    ...    1. Open Order History dashboard.
    ...    2. Capture Delivered order count.
    ...    3. Capture In-Progress order count.
    ...    4. Capture Rejected order count.
    ...    5. Capture Expired order count.
    ...    6. Display all counts in console logs.

Verify order history dashboard
    Sleep    3s
    ${delivered}    Get Text    ${delivered}
    Log To Console    Order delivered count:${delivered}

    ${order_inprogress}    Get Text    ${order_inprogress}
    Log To Console    Order in-progress count:${order_inprogress}

    ${reject_count}     Get Text    ${reject_count}
    Log To Console    Order Reject count:${reject_count}

    ${expired}     Get Text    ${expired}
    Log To Console    Order expired count:${expired}
    Sleep    2s


#Verify Notify Care Executive
    [Documentation]
    ...    Verify the Notify Care Executive functionality for an order with
    ...    "Delivery Boy Assigned" status.
    ...    Validation:
    ...    1. Check if an order card with "Delivery Boy Assigned" status is present.
    ...    2. Open the order details page.
    ...    3. Scroll to the bottom of the order details.
    ...    4. Verify the "Notify Care Executive" button is displayed.
    ...    5. Click on "Notify Care Executive".
    ...    6. Navigate back to the previous screen.


Verify notify care executive

     ${is_present5}=    Run Keyword And Return Status   Element Should Be Visible    ${order_card}    5s
    IF    ${is_present5}
    Sleep    2s
    ${order_card}=    Set Variable    //div[contains(@class,'card')]//span[text()='Delivery Boy Assigned']/ancestor::div[contains(@class,'card')]
    Wait Until Element Is Visible    ${order_card}
    Scroll Element Into View    xpath=//span[text()='Delivery Boy Assigned']/ancestor::div[contains(@class,'card')]
    Click Element    ${order_card}
    Sleep    5s
    Execute JavaScript    window.scrollBy(0,1500)
    Sleep    5s
    Page Should Contain Element    ${notify_care_executive}
    Click Element    ${notify_care_executive}
    Sleep    5s
    Scroll Element Into View    ${back}
    Click Element    ${back}
     ELSE
    Log To Console    No order present with "Delivery boy assigend " status
#    Click Element    ${back_home}
     END

#Verify Upload Invoice
    [Documentation]
    ...    Verify invoice upload functionality for a completed order.
    ...
    ...    Validation:
    ...    1. Open Order History and verify a completed order is available.
    ...    2. Open the completed order details.
    ...    3. Verify patient mobile number popup opens and closes successfully.
    ...    4. Verify patient WhatsApp link opens successfully in a new window/tab.
    ...    5. Verify patient location link opens successfully in a new window/tab.
    ...    6. Navigate back to the order details page.
    ...    7. Scroll to the Upload Invoice section.
    ...    8. Verify the Upload Invoice button is displayed.
    ...    9. Click Upload Invoice and select a valid invoice file.
    ...    10. Upload the selected invoice.

Verify Upload invoice
    ${is_present6}=    Run Keyword And Return Status   Element Should Be Visible    ${order_card}    5s
    IF    ${is_present6}
    Sleep    2s
    ${order_card}=    Set Variable    //div[contains(@class,'card')]//span[text()='Completed']/ancestor::div[contains(@class,'card')]
    Wait Until Element Is Visible    ${order_card}
    Scroll Element Into View    xpath=//span[text()='Completed']/ancestor::div[contains(@class,'card')]
    Click Element    ${order_card}
    Sleep    4s
    Click Element    ${patient_mobileno}
    Click Element    ${close}
    Sleep    3s
    Click Element    ${patient_whatsapp}
    Switch Window
    Sleep    3s
    Click Element    ${patient_Location}
    Switch Window
    Sleep    2s

    Scroll Element Into View    ${upload_invoice}
    Page Should Contain Element    ${upload_invoice}
    Click Element    ${upload_invoice}
    Sleep    3s
    Run Process
    ...    python
    ...    C:/Users/dell/PycharmProjects/PythonProject1/upload_invoice.py
    Sleep    3s
    Click Element    ${upload}
    ELSE
    Log To Console    No order present with "Completed" status
    END