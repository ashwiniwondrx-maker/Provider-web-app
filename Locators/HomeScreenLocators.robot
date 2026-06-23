*** Variables ***

${REFRESHNEWORDER}   xpath = //span[normalize-space()='Refresh Orders']

${ORDERACCEPTBTN}   xpath =  //div[@class='new-orders-preview-container']//div[1]//div[2]//div[3]//button[2]

${ADDLABTEST}      xpath = //div[@class='medicines-header']//span[1]//*[name()='svg']

${SEARCHLABTEST}   xpath = //input[@placeholder='Search Lab Test']

${ADDBTN}          xpath = //button[normalize-space()='Add']

${SELECTTEST}      xpath = //div[@class='search-medicine-item-name']

${EDITLABTESTBTN}   xpath = //div[@class='medicine-edit-container']
${EDITPRICE}        xpath = /html[1]/body[1]/div[1]/div[1]/div[2]/div[1]/main[1]/div[1]/div[1]/div[1]/div[3]/div[2]/input[1]
${UPDATEBUTTON}     xpath = //button[normalize-space()='Update']

${DELETEBTN}        xpath = //div[@class='medicine-remove-container']
${DELETEREASON}     xpath = //select[@class='reason-select']
${CONFIRMBTN}       xpath = //button[@class='confirm-btn']
${EDITTEXT}         xpath = //span[normalize-space()='Edit Lab Test']

${PATIENTDETAILS}   xpath = //span[normalize-space()='Note:']
${CALLICON}         xpath = //div[@class='patient-details-action-buttons']//i[@class='bi bi-telephone']
${CLOSEBTN}         xpath = //button[@class='close-btn']

${WHATSUPICON}     xpath = //div[@class='patient-details-container']//button[2]
${LOCATION}        xpath = //i[@class='bi bi-geo-alt']

${CLICKSLOT}        xpath = //span[normalize-space()='Schedule Slot']

${CALENDER}         xpath = xpath=//input[@type='date']

${TIMEPICKER}       xpath = xpath=//input[@type='time']

${REPEATSLOTCLICK}  xpath = //div[@class='schedule-modal-repeat-box']

${SELECTREPEATSLOT}  xpath = //input[@value='daily']

${SESSIONSELECTION}   xpath = //input[@placeholder='10']

${SETSLOT}   xpath = //button[normalize-space()='Set Slot']

${SCHEDULESLOTCONFIRMBTN}   xpath = //span[normalize-space()='Confirm']

${SERVICEATLABBTN}     xpath = //span[normalize-space()='Service at Lab']



${verifysearch}  xpath = //input[@placeholder='Search order by ID']
${SEARCHBTN}    xpath = //button[normalize-space()='Search']
${SEARCHCLICK}  xpath = //button[@role='option']

${search_card}   xpath = //div[@class='top-bar-search-dropdown__empty']



