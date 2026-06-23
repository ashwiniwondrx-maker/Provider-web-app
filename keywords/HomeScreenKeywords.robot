*** Settings ***

Library  SeleniumLibrary
Resource   ../Locators/CommonLocators.robot

Resource   ../Locators/HomeScreenLocators.robot
Library  OperatingSystem
Library    DateTime
Variables  ../Config.py

*** Keywords ***

Refresh order and tap on Accept order button
   [Documentation]   Test case 1  Refresh order and accept if present


   # Refresh orders
   ##Wait Until Element Is Visible    ${REFRESHNEWORDER}    10s
   #Click Element                   ${REFRESHNEWORDER}


    Wait Until Element Is Visible     ${verifysearch}    5s
    ${placeholder}=   Get Element Attribute    ${verifysearch}    placeholder
    Should Be Equal    ${placeholder}    Search order by ID
    Element Should Be Enabled    ${verifysearch}
    Wait Until Element Is Visible     ${verifysearch}    5S
     Input Text    ${verifysearch}     18597
     Page Should Contain Element    ${SEARCHBTN}
     Click Element    ${SEARCHBTN}
     Sleep    5s

    ${is_present}=    Run Keyword And Return Status   Element Should Be Visible    ${search_card}    5s
    IF    ${is_present}
       Log To Console    order is present with this order id
           Click Element    ${verifysearch}
           Press Keys    ${verifysearch}    CTRL+A+BACKSPACE
      ELSE
       Log To Console    order is not present with this order id
       Click Element    ${verifysearch}
       #Clear Element Text    ${verifyserach}
       Page Should Contain Element    ${REFRESHNEWORDER}  10s
       Click Element    ${REFRESHNEWORDER}
       END
       Sleep    10s

   Sleep    2s
   # Check if order is present (wait for few seconds)
   ${record_found}=    Run Keyword And Return Status
   ...    Wait Until Element Is Visible    ${ORDERACCEPTBTN}    10s


   IF    ${record_found}


       Log To Console    Order found, accepting...
       Wait Until Element Is Visible    ${ORDERACCEPTBTN}  10s
       Click Element    ${ORDERACCEPTBTN}


       # Scroll down
       #Press Keys    None    PAGE_DOWN


   ELSE


       Log To Console    No order present
       Press Keys    None    PAGE_DOWN
       Wait Until Page Contains    No order present in the list    10s


   END


Adding And Managing Lab Test
   [Documentation]    Test Case: Click on Add Lab Test button, search and select lab test, edit price, save, and delete the lab test.


   ${record_found}=    Run Keyword And Return Status
   ...    Wait Until Element Is Visible    ${ADDBTN}    10s


   IF    ${record_found}


       Log To Console    \n Order accepted, now clicking on Add Lab Test button...


       # Click on Add Lab Test
       Wait Until Element Is Visible    ${ADDLABTEST}    15s
       Click Element    ${ADDLABTEST}
       Sleep    5s


       # Search and select lab test
       Log To Console    Searching and selecting the lab test...
       Wait Until Element Is Visible    ${SEARCHLABTEST}    10s
       Click Element    ${SEARCHLABTEST}
       Input Text    ${SEARCHLABTEST}    com
       Sleep    5s


       Wait Until Element Is Visible    ${SELECTTEST}    15s
       Sleep    5s
       Double Click Element    ${SELECTTEST}
       Wait Until Element Is Visible    ${ADDBTN}   10s
      Click Element    ${ADDBTN}
      Sleep    20s


       # Edit Lab Test
       Log To Console    Clicking on Edit Lab Test icon...
       Mouse Over    ${EDITLABTESTBTN}
       Wait Until Element Is Visible    ${EDITLABTESTBTN}    15s
       Wait Until Element Is Visible    ${EDITLABTESTBTN}    10s
       Sleep    10s
       Click Element    ${EDITLABTESTBTN}
       Wait Until Element Is Visible    ${EDITTEXT}    15s
       Sleep    5s


       # Edit price and updating
       Log To Console    Editing price and updating...
       Wait Until Element Is Visible    ${EDITPRICE}    10s
       Mouse Over    ${EDITPRICE}
       Double Click Element    ${EDITPRICE}
       Sleep    5s
       Clear Element Text    ${EDITPRICE}
       Input Text    ${EDITPRICE}    300
       Sleep    5s


       Wait Until Element Is Visible    ${UPDATEBUTTON}    10s
       Click Element    ${UPDATEBUTTON}
       Sleep    20s


       # Delete Lab Test / Click on delete lab test icon, select reason and click on confirm button
       Log To Console    Deleting lab test...
       Mouse Over    ${DELETEBTN}
       Wait Until Element Is Visible    ${DELETEBTN}    10s
       Sleep    5s
       Double Click Element    ${DELETEBTN}


       Wait Until Element Is Visible    ${CONFIRMBTN}  10s
       Click Element    ${CONFIRMBTN}




   ELSE


       Log To Console    No order present
       Press Keys    None    PAGE_DOWN
       Wait Until Page Contains    No order present in the list    10s


   END


Add Schedule slot
  [Documentation]  Test case 2 : Adding scheduling slot
  Log To Console    Adding schedule slot

  Mouse Over    ${CLICKSLOT}
  Wait Until Element Is Visible    ${CLICKSLOT}   10s
  Click Element    ${CLICKSLOT}
  Sleep    5s
  ${today}=    Get Current Date    result_format=%d-%m-%Y

    Click Element    xpath=//input[@type='date']

    Press Keys    xpath=//input[@type='date']    CTRL+a+BACKSPACE
    Press Keys    xpath=//input[@type='date']    ${today}

# Get current datetime + 15 mins
    ${future_time}=
...    Evaluate
...    (datetime.datetime.now() + datetime.timedelta(minutes=30)).strftime("%H:%M")
...    modules=datetime

    Log To Console    ${future_time}

# Click time field
    Click Element    xpath=//input[@type='time']

# Clear existing value
    Press Keys    xpath=//input[@type='time']    CTRL+a+BACKSPACE

# Input new time
    Press Keys    xpath=//input[@type='time']    ${future_time}


  Log To Console    Click on repeat slot field and seleting slot repeat...
  Wait Until Element Is Visible    ${REPEATSLOTCLICK}   10s
  Click Element    ${REPEATSLOTCLICK}
  Sleep    5s

  Log to console   Selecting repeating slot from the radio button list
  Wait Until Element Is Visible    ${SELECTREPEATSLOT}   10s
  Click Element    ${SELECTREPEATSLOT}
  Press Keys   NONE   TAB


  # selecting sessions option from the repeat click on repeat and then you will see the session field


  Log to console   Clicking on  final confirm button of the schedule slot
  Wait Until Element Is Visible    ${SCHEDULESLOTCONFIRMBTN}   10s
  Click Element    ${SCHEDULESLOTCONFIRMBTN}
  Sleep    20s


Click on on patient details icon
  [Documentation]   Click on patient details icon like telephone , whats up , location
  Scroll Element Into View    ${SERVICEATLABBTN}
  Wait Until Element Is Visible    ${SERVICEATLABBTN}  10s
  Sleep    10s
  Log To Console    Clicking on call icon
  Wait Until Element Is Visible    ${CALLICON}     10s
  Click Element    ${CALLICON}
  Sleep    10s
  Log To Console    Clicking on whats up icon
  Wait Until Element Is Visible    ${WHATSUPICON}   10s
  Switch Window
  Sleep    10s
  Log To Console    clicking on location icon
  Wait Until Element Is Visible    ${LOCATION}  10s
  Switch Window


  Log To Console    Clicking on service at lab button


  #Scroll Element Into View    ${SERIVEATLABBTN}
  #Wait Until Element Is Visible    ${SERIVEATLABBTN}  10s
  #Click Element    ${SERIVEATLABBTN}
  Sleep    20s






   


  
