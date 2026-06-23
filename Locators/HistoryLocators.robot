*** Variables ***

${HISTORYSCREEN}   xpath=//body/div[@id='root']/div[@id='nav-sm-bar']/div[@class='wrx-sidebar-col']/aside[@class='wrx-sidebar wrx-sidebar--desktop open']/nav[@class='wrx-sidebar__nav']/div[@class='wrx-sidebar__items']/div[2]/a[1]/div[1]
${ORDERHISTORYTXT}   xpath = //h5[@class='mb-0 fw-semibold']
${CARD}    xpath = //div[@class='d-flex align-items-center gap-2']
${SERVICECOMPLETEPCARD}   xpath = //div[normalize-space()='Service Completed']
${ORDERINPROGRESSCARD}   xpath = //div[normalize-space()='Order in Progress']


${ADDLABTEST}      xpath = //div[@class='medicines-header']//span[1]//*[name()='svg']



${SEARCHLABTEST}   xpath = //input[@placeholder='Search Lab Test']

${ADDBTN}          xpath = //button[normalize-space()='Add']

${SELECTTEST}      xpath = //div[@class='search-medicine-item-name']


#${verifyserach}  xpath = //input[@placeholder='Search order by ID']
#${SEARCHBTN}    xpath = //button[normalize-space()='Search']
#${SEARCHCLICK}  xpath = //button[@role='option']
#${search_card}   xpath = //div[@class='top-bar-search-dropdown__empty']



${SCHEDULESLOT}   xpath = //span[normalize-space()='Schedule Slot']

${REPEATSLOTCLICK}     xpath = //div[@class='schedule-slot-container-overlay']//span[2]

${SELECTSLOT}         xpath = //input[@value='daily']

${SESSION_COUNT}      xpath = //input[@placeholder='10']


${SETSLOTBTN}         xpath = //button[normalize-space()='Set Slot']

${CONFIRM_SLOT_BTN}    xpath = //span[text()='Confirm']

${ORDERINPROGRESSCARD}  xpath = /html[1]/body[1]/div[1]/div[1]/div[2]/div[1]/main[1]/div[1]/div[5]/div[2]/div[1]/div[1]

${SERVICE_AT_LAB_BTN}   xpath = //span[normalize-space()='Service at Lab']

${BACK_ARROW}      xpath = //button[@class='review-order-page-header-back-button']//*[name()='svg']