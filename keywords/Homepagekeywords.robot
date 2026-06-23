*** Settings ***
Library    SeleniumLibrary
Resource    ../Locators/Homepagelocators.robot
Library    String
Library    DateTime


*** Keywords ***
#Verify left menu items are visible
 [Documentation]
    ...    Verify that dashboard menu items are visible.
    ...    Validation:
    ...    1. Home menu is visible
    ...    2. History menu is visible
    ...    3. Profile menu is visible
    ...    4. Logout menu is visible
Verify Home page
    Wait Until Element Is Visible    ${verifyhomepage}    10s
    Page Should Contain  Home
     Wait Until Element Is Visible     ${verifyhistory}    5s
    Page Should Contain    History
    Wait Until Element Is Visible     ${verifyprofile}    5s
    Page Should Contain    Profile
     Wait Until Element Is Visible    ${verifylogout}    5s
    Page Should Contain    Logout
#Verify menu labels match expected text
 [Documentation]
    ...    Verify that dashboard labels display expected values.
    ...    Expected labels:
    ...    - Home
    ...    - History
    ...    - Profile
    ...    - Logout
Verify Dashboard Text
    ${text}=    Get Text  ${verifyhomepage}
    Should Be Equal    ${text}    Home
    ${text1}=    Get Text    ${verifyhistory}
    Should Be Equal    ${text1}    History
    ${text2}=    Get Text    ${verifyprofile}
    Should Be Equal    ${text2}    Profile
    ${text3}=    Get Text    ${verifylogout}
    Should Be Equal    ${text3}    Logout

#Verify Search by valid and Invalid order ID
 [Documentation]
    ...    Verify search functionality using valid and invalid order IDs.
    ...    Validation:
    ...    1. Search input field is visible
    ...    2. Placeholder text matches expected value
    ...    3. Search field accepts order ID
    ...    4. Order details are displayed if order exists
    ...    5. Search field clears properly
Verify serach bar

    Wait Until Element Is Visible     ${verifyserach}    5s
    ${placeholder}=   Get Element Attribute    ${verifyserach}    placeholder
    Should Be Equal    ${placeholder}    Search order by ID
    Element Should Be Enabled    ${verifyserach}
    Wait Until Element Is Visible     ${verifyserach}    5S
     Input Text    ${verifyserach}     18597
     Page Should Contain Element    ${search}
     Click Element    ${search}
     Sleep    5s
    ${is_present}=    Run Keyword And Return Status   Element Should Be Visible    ${search_card}    5s
    IF    ${is_present}
       Log To Console    order is present with this order id
           Click Element    ${verifyserach}
           Press Keys    ${verifyserach}    CTRL+A+BACKSPACE
      ELSE
       Log To Console    order is not present with this order id
       Click Element    ${verifyserach}
       Clear Element Text    ${verifyserach}
       Click Element    ${Refreshorder}
       END

#Verify Rx Coin Balance card displays icon, value, and label
 [Documentation]
    ...    Verify Rx coin balance section.
    ...    Validation:
    ...    1. Rx Coin label is displayed
    ...    2. Rx icon is visible
    ...    3. Coin balance value is displayed
Verify Rx coin
    Wait Until Element Is Visible    ${verifyRxbalance}    10s
    ${text4}=    Get Text    ${verifyRxcoin}
    Should Be Equal    ${text4}    Rx Coin Balance
    Wait Until Element Is Visible     ${verifyRxicon}    10s
    Element Should Be Visible    ${verifyRxicon}
    ${verifyRxbalance}=    Get Text  ${verifyRxbalance}
    log to console    ${verifyRxbalance}
    IF   ${verifyRxbalance} >0
    Log To Console    Coins available:${verifyRxbalance}
   ELSE
    Log To Console    No coins available
    END
#panel title,order accpeted count and Estimted revenue
 [Documentation]
    ...    Verify the Orders In-progress section.
    ...    Validation:
    ...    1. Orders In-progress title is displayed
    ...    2. Accepted order count is displayed
    ...    3. Estimated revenue value is displayed
    ...    4. Delivery pending count is displayed

Verify orderIn-progress
    Wait Until Element Is Visible   ${Verifyorderinprogress}    10s
    ${text5}=    Get Text    ${Verifyorderinprogress}
    Should Be Equal    ${text5}    Orders In-progress
     Element Should Be Visible    ${verifyorderaccepted}    10s
     Page Should Contain Element    ${verifyorderaccepted}
    ${verifyorderaccepted}=    Get Text    ${verifyorderaccepted}
     log to console    ${verifyorderaccepted}

    IF    ${verifyorderaccepted} >0
     Log to console    orderaccepted:${verifyorderaccepted}
    ELSE
     Log To Console    Noorderaccepted
    END
    Wait Until Element Is Visible     ${Verifyestimtedrevenue}    10s
  ${Verifyrevenue}=    Get Text    ${Verifyestimtedrevenue}
    Log To Console    ${Verifyestimtedrevenue}
    ${clean_value}=    Replace String    ${Verifyrevenue}    ₹    ${EMPTY}
    ${clean_value}=    Replace String    ${clean_value}    L    ${EMPTY}

     Log To Console    Cleaned value: ${clean_value}
     ${revenue}=    Convert To Number    ${clean_value}

    IF    ${revenue} >0
     Log To Console    estimtedrevenue:${revenue}
    ELSE
     Log To Console    noestimtedrevenue
    END
    Wait Until Element Is Visible    ${verifyneworder}    10s
    ${text6}=    Get Text    ${verifyneworder}
    Should Be Equal    ${text6}    New Orders
    Wait Until Element Is Visible     ${Verifydeliverypending}    20s
    ${Verifydeliverypending}=   Get Text    ${Verifydeliverypending}
    ${count_text}=    Evaluate    """${Verifydeliverypending}""".splitlines()[-1].strip()
    ${count}=    Convert To Integer    ${count_text}
     IF    ${count} >0
     Log to console    deliverypending:${count}
    ELSE
     Log To Console    No deliverypending
    END
#Verify each in-progress order card shows core details
 [Documentation]
    ...    Verify order information displayed inside the In-progress order card.
    ...    Validation:
    ...    1. Order card is visible
    ...    2. Date and time are displayed
    ...    3. Patient/Doctor name is displayed
    ...    4. Order status is displayed

Verify order in-progress card

    ${is_present}=    Run Keyword And Return Status   Element Should Be Visible    ${orderinprogress_card}    5s
    IF    ${is_present}
    Page Should Contain Element    ${orderinprogress_card}
    Log To Console    order is present in order in-progress
    ${datetime of order in-progress}=    Get Text    ${datetime of order in-progress}
    Log To Console    ${datetime of order in-progress}
    ${patient or doctor name}=    Get Text    ${patient or doctor name}
    Log to Console    ${patient or doctor name}
    ${order_status}=    Get Text    ${pending_order_status}
      Log To Console    ${order_status}
    ELSE
      Log To Console    No order in-progress present
    END


#Verify New Order dashboard details.
 [Documentation]
    ...    Verify New Order dashboard details.
    ...    Validation:
    ...    1. New order count is displayed
    ...    2. Expiring soon count is displayed
    ...    3. Estimated revenue is displayed
    ...    4. Count values are valid
Verify new order count
    Wait Until Element Is Visible   ${verifyneworder}    10s
    ${text6}=    Get Text    ${verifyneworder}
    Should Be Equal    ${text6}    New Orders
     Element Should Be Visible    ${verifyneworder_count}    10s
     Page Should Contain Element    ${verifyneworder_count}
    ${verifyneworder_count}=    Get Text    ${verifyneworder_count}
    ${count_text}=    Replace String    ${verifyneworder_count}    New Orders    ${EMPTY}
    ${count_text}=    Strip String    ${count_text}
    ${count}=    Convert To Integer    ${count_text}

    IF   ${count} > 0
     Log to console    New order:${count}
    ELSE
     Log To Console    No Neworder
    END

     Element Should Be Visible    ${verifyexpiringsoon}    10s
    ${verifyexpiringsoon}=    Get Text    ${verifyexpiringsoon}
    ${count_expiring}=    Replace String    ${verifyexpiringsoon}    Expiring Soon    ${EMPTY}
    ${count_expiring}=    Strip String    ${count_expiring}
    ${count1}=    Convert To Integer    ${count_expiring}

    IF    ${count1} >0
     Log to console    Expiring soon:${count1}
    ELSE
     Log To Console    No expiring soon
    END
     Wait Until Element Is Visible    ${verifyneworderestimtedrevenue}    10s
  ${verifyneworderestimtedrevenue}=    Get Text    ${verifyneworderestimtedrevenue}
    Log To Console    ${verifyneworderestimtedrevenue}
    ${clean_value}=    Replace String    ${verifyneworderestimtedrevenue}    ₹    ${EMPTY}


     Log To Console    Cleaned value: ${clean_value}
     ${revenue}=    Convert To Number    ${clean_value}

    IF    ${revenue} >0
     Log To Console    estimtedrevenue:${revenue}
    ELSE
     Log To Console    noestimtedrevenue
    END

# Verify new order card shows core details
 [Documentation]
    ...    Verify new order card details.
    ...    Validation:
    ...    1. New order card is visible
    ...    2. Date and time are displayed
    ...    3. Patient name is displayed
    ...    4. Estimated revenue is displayed
Verify new order
    ${is_present2}=    Run Keyword And Return Status   Element Should Be Visible    ${neworder_card}    5s
    IF    ${is_present2}
    Page Should Contain Element    ${neworder_card}
    Log To Console   new order is present
    ${date_time}=    Get Text    ${date_time}
    Log To Console    ${date_time}
    ${patientname}=    Get Text    ${patientname}
    Log to Console    ${patientname}
    ${neworderestimtedrevenue}=    Get Text    ${neworderestimtedrevenue}
    Log To Console    ${neworderestimtedrevenue}
    ${clean_value1}=    Replace String    ${neworderestimtedrevenue}    ₹    ${EMPTY}
     Log To Console    Cleaned value: ${clean_value1}
     ${revenue1}=    Convert To Number    ${clean_value1}

    IF    ${revenue1} >0
     Log To Console    new order estimtedrevenue:${revenue1}
    ELSE
     Log To Console    noestimtedrevenue
    END
    ELSE
     Log To Console    NO NEW ORDER
    END

#Add and edit medicine
 [Documentation]
    ...    Verify medicine addition and update functionality.
    ...    Validation:
    ...    1. Accept new order
    ...    2. Search medicine
    ...    3. Add medicine to order
    ...    4. Edit medicine details
    ...    5. Update medicine
    ...    6. Handle lead address and pincode
    ...    7. Assign order for delivery
Verify add medicine
    ${is_present2}=    Run Keyword And Return Status   Element Should Be Visible    ${neworder_card}    5s
    IF    ${is_present2}

    Click Element    ${accept_btn}
    Wait Until Element Is Visible    ${add_medicine}    10s
    Sleep    5s
    Click Element    ${add_medicine}
    Input Text    ${search_medicine}    Dolo
    Wait Until Element Is Visible    ${select_medicine}    15S
    Sleep    5s
    Double Click Element    ${select_medicine}
    Scroll Element Into View    ${Add}
    Click Element    ${Add}
    Sleep    2s
    Click Element    ${Editmedicine}
    Click Element    ${clearmedicine}
    Press Keys    None    BACKSPACE
    Press Keys    None    BACKSPACE
    Click Element    ${updatemedicine}
    Sleep    5s
    ${is_present1}=    Run Keyword And Return Status   Element Should Be Visible    ${add_pincode}    5s

    IF    ${is_present1}
        Log To Console    this is a lead:
     Scroll Element Into View    ${add_pincode}
     Page Should Contain Element    ${add_pincode}
     Click Element    ${add_pincode}
     Wait Until Element Is Visible   ${address_popup}    10s
     Sleep    5S
   Execute JavaScript
...    let input = document.querySelector('div.address-modal input');
...    let nativeInputValueSetter = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, 'value').set;
...    nativeInputValueSetter.call(input, 'KAILASH BUSSINESS PARK VIKHROLI');
...    input.dispatchEvent(new Event('input', { bubbles: true }));

    Sleep    2s

    Press Keys    xpath=//input[@placeholder='Enter Address']    TAB
     Sleep    5s
     Wait Until Element Is Visible   ${Pincode}    5s
     Click Element    ${Pincode}
     Input Text    ${Pincode}    400079
     Click Element    ${confirm_btn}

    Scroll Element Into View    ${assign_fordelivery}
    Sleep    5s
    Click Element    ${assign_fordelivery}
    ELSE
     Log To Console    this is a order:
     Scroll Element Into View    ${assign_fordelivery}
     Sleep    5s
    Click Element    ${assign_fordelivery}
    END
    ELSE
    Log To Console    :NO NEW ORDER IS PRESENT
    END

# Verify Cancel Order and add discount Functionality
    [Documentation]
    ...    Verify cancel order functionality.
    ...    Validation:
    ...    1. Open New Order section
    ...    2. Verify new order card is available
    ...    3. Accept the order
    ...    4. Open Add Discount section
    ...    5. Apply discount using slider
    ...    6. Save the discount
    ...    7. Open Cancel Order option
    ...    8. Select cancellation reason
    ...    9. Confirm order cancellation
    ...    10. Verify order is cancelled successfully
    ...    11. If no order is available, display appropriate message
Verify cancel order
    Execute JavaScript    window.scrollBy(0,-2000)
    Sleep    3s
    ${is_present3}=    Run Keyword And Return Status   Element Should Be Visible    ${neworder_card}    5s
    IF    ${is_present3}
    Click Element    ${accept_btn}
    sleep    3s
    Scroll Element Into View    ${add_discount}
    Sleep    2s
#    Page Should Contain Element    ${add_discount}
    Click Element    ${add_discount}
     Wait Until Element Is Visible    ${discount_slider}    10s
     Sleep    2s
     # Move slider to right
    Drag And Drop By Offset    ${discount_slider}    40    0
    Sleep    2s
    Page Should Contain Element    ${add_btn}
    Click Element    ${add_btn}
    Sleep    2s
    Scroll Element Into View    ${Cancel_order}
    Click Element    ${Cancel_order}
    Click Element    ${Cancel_reason}
    Sleep    2s
    Click Element    ${cancel_confirm}
    ELSE
    Log To Console    :NO NEW ORDER IS PRESENT
    END

#Reject a order
 [Documentation]
    ...    Verify reject functionality for new orders.
    ...    Validation:
    ...    1. Reject button is visible
    ...    2. Reject reason popup opens
    ...    3. Reason selection works
    ...    4. Order rejection confirmation works
Verify reject new order
    Sleep    5s
    Execute JavaScript    window.scrollBy(0,-500)
    ${is_present2}=    Run Keyword And Return Status   Element Should Be Visible    ${neworder_card}    10s
    IF    ${is_present2}
         Log To Console    New order is present
      Wait Until Element Is Visible    ${neworder_card}    5s
    Scroll Element Into View    ${neworder_card}
    Click Element    ${reject_btn}
    Press Keys    ${reject_reason}    TAB
    Press Keys    ${None}    ENTER
    Wait Until Element Is Visible    ${reject_reason}    10s
    Sleep    2s
    Click Element    ${select_reason}
    Wait Until Element Is Visible    ${confirm}   10s
    Wait Until Element Is Enabled    ${confirm}  10s
    Click Element                    ${confirm}
    ELSE
    Log To Console    no new order is present
    END























