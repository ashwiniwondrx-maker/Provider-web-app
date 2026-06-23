*** Settings ***

Library  SeleniumLibrary
Resource   ../Locators/CommonLocators.robot
Resource   ../Locators/HistoryLocators.robot
Resource   ../Locators/HomeScreenLocators.robot
Library  OperatingSystem
Library    DateTime
Variables  ../Config.py

*** Keywords ***

Navigate to order history screen
    [Documentation]
    Log To Console    \nNavigate to order history screen

    Wait Until Element Is Visible    ${HISTORYSCREEN}    10s
    Click Element    ${HISTORYSCREEN}

    # Handle new window if opened
    ${handles}=    Get Window Handles
    Switch Window    ${handles}[-1]

    Wait Until Page Contains Element    ${ORDERHISTORYTXT}    15s


Verify Order History UI
    [Documentation]  Checks all Order History elements

    ${elements}=    Create List
    ...   ${ORDERHISTORYTXT}
    ...   ${CARD}
    #...   ${ALLFILTERTEXT}
    ...   ${ORDERINPROGRESSCARD}
    #...   ${REJECTOREXPIREDCARD}
    #...   ${NEWESTTEXT}

    Log To Console    \nVerifying all Order History elements...

    FOR    ${element}    IN    @{elements}
        ${status}    ${msg}=    Run Keyword And Ignore Error
        ...    Wait Until Element Is Visible    ${element}    10s

        Run Keyword If    '${status}'=='PASS'
        ...    Log To Console    ✅ ${element} visible

        Run Keyword If    '${status}'=='FAIL'
        ...    Log To Console    ❌ ${element} missing
    END


Navigate to order in progress screen
   [Documentation]    Clicking on order in progress card and upload

   #${is_present}=    Run Keyword And Return Status   Element Should Be Visible    ${ORDERINPROGRESSCARD}    5s
   # IF    ${is_present}
   Wait Until Element Is Visible    ${ORDERINPROGRESSCARD}   10S
   Click Element    ${ORDERINPROGRESSCARD}
   Sleep    10s
   ${order_card}=    Set Variable    xpath=//div[contains(@class,'card')]//span[normalize-space()='Pending Review']/ancestor::div[contains(@class,'card')]
    Wait Until Element Is Visible    ${order_card}
    Scroll Element Into View    xpath=//span[normalize-space()='Pending Review']

    Click Element    ${order_card}
    Sleep    5s
    Execute JavaScript    window.scrollBy(0,1000)
    Sleep    5s
    
    Log To Console    clicking on schedule slot
    Scroll Element Into View    ${SCHEDULESLOT}
    Wait Until Element Is Visible   ${SCHEDULESLOT}  10s
    Click Element    ${SCHEDULESLOT}

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
    Sleep    5s

    #Clicking on slot repeat 
    Wait Until Element Is Visible    ${REPEATSLOTCLICK}  10s
    Click Element    ${REPEATSLOTCLICK}
    Sleep    5s

    #Selecting slot from the list 
    Wait Until Element Is Visible    ${SELECTSLOT}   10s
    Click Element    ${SELECTSLOT}
    Sleep    5s
    
    #selecting session count  for lab test
    Page Should Contain Element    ${SESSION_COUNT}   10s
    Click Element    ${SESSION_COUNT}
    Clear Element Text    ${SESSION_COUNT}
    Input Text    ${SESSION_COUNT}    1

    #Clicking on set slot button
    Wait Until Element Is Visible    ${SETSLOTBTN}   10s
    Click Element    ${SETSLOTBTN}
    Sleep    5s
    

    #Clicking on confirm button of the schedule slot
#    Wait Until Element Is Visible    ${CONFIRM_SLOT_BTN} 10s
    Sleep    5s
    Click Element    ${CONFIRM_SLOT_BTN}
    Sleep    60s
    
    Log To Console    Clicking on schedule on slot button / Clicking on service at lab button..

Adding And Managing Lab Test
    [Documentation]    Test Case: Click on Add Lab Test button, search and select lab test, save it, and verify Service At Lab section.

    ${record_found}=    Run Keyword And Return Status
    ...    Wait Until Element Is Visible    ${ADDBTN}    10s

    IF    ${record_found}

        Log To Console    \nOrder accepted, now clicking on Add Lab Test button...

        # Click on Add Lab Test
        Wait Until Element Is Visible    ${ADDLABTEST}    15s
        Scroll Element Into View    ${ADDLABTEST}
        Click Element    ${ADDLABTEST}

        # Search and select lab test
        Log To Console    Searching and selecting the lab test...
        Wait Until Element Is Visible    ${SEARCHLABTEST}    10s
        Click Element    ${SEARCHLABTEST}
        Clear Element Text    ${SEARCHLABTEST}
        Input Text    ${SEARCHLABTEST}    com

        Wait Until Element Is Visible    ${SELECTTEST}    15s
        Scroll Element Into View    ${SELECTTEST}
        Double Click Element    ${SELECTTEST}

        # Click Add button
        Wait Until Element Is Visible    ${ADDBTN}    10s
        Scroll Element Into View    ${ADDBTN}
        Click Element    ${ADDBTN}

        Log To Console    Lab Test selected and Add button clicked

    ELSE

        Fail    Add button is not visible. Cannot proceed with Lab Test addition.

    END

    # Verify Service At Lab button
    ${service_btn_found}=    Run Keyword And Return Status
    ...    Wait Until Element Is Visible    ${SERVICE_AT_LAB_BTN}    20s

    IF    ${service_btn_found}

        Press Keys    None    PAGE_DOWN
        Scroll Element Into View    ${SERVICE_AT_LAB_BTN}
        Page Should Contain Element    ${SERVICE_AT_LAB_BTN}
        Click Element    ${SERVICE_AT_LAB_BTN}

        Log To Console    Service At Lab section opened successfully

    ELSE

        Fail    Lab Test was not added successfully or Service At Lab button is not visible.

    END

    # Navigate Back
    Wait Until Element Is Visible    ${BACK_ARROW}    10s
    Click Element    ${BACK_ARROW}

    Log To Console    Test completed successfully










