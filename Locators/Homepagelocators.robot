*** Variables ***

${verifyhomepage}    xpath=//aside[@class='wrx-sidebar wrx-sidebar--desktop open']//div[@class='wrx-sidebar-label'][normalize-space()='Home']
${verifyhistory}    xpath=//aside[@class='wrx-sidebar wrx-sidebar--desktop open']//div[@class='wrx-sidebar-label'][normalize-space()='History']
${verifyprofile}    xpath=//aside[@class='wrx-sidebar wrx-sidebar--desktop open']//div[@class='wrx-sidebar-label'][normalize-space()='Profile']
${verifylogout}    xpath=//aside[@class='wrx-sidebar wrx-sidebar--desktop open']//button[@class='wrx-sidebar__logout-btn']

${verifyserach}    xpath=//input[@placeholder='Search order by ID']
${verifysearchbtn}    xpath=//button[normalize-space()='Search']

${verifyRxcoin}    xpath=//div[@class='rx-coin-balance-line']
${verifyRxicon}    xpath=//div[@class='rx-coin-icon']//img
${verifyRxbalance}    xpath=//div[@class='rx-coin-balance-amount']

${verifyorderaccepted}    xpath=//span[@class='pending-summary-value']
${Verifyorderinprogress}    xpath=//div[contains(text(),'Orders In-progress')]
${Verifyestimtedrevenue}    xpath=//span[@class='pending-summary-value estd-revenue-price']
${Verifydeliverypending}    xpath=(//div[@class="pending-order-delivery-pending"]//span)[2]

${verifyneworder}    xpath=//div[normalize-space()='New Orders']
${verifyneworder_count}    xpath=//div[@class='new-order-count']
${verifyexpiringsoon}    xpath=//div[@class='expiring-soon-orders']
${verifyneworderestimtedrevenue}    xpath=//div[@class='new-orders-preview-summary']//div[@class='left']//span[1]

${neworder_card}    xpath=//div[@class='order-action-item-container']
${date_time}    xpath=(//div[@class='new-orders-container']/div[1]//*[contains(text(),'|')])[1]
${patientname}     xpath=//div[@class='new-orders-container']//div[1]//div[1]//div[2]
${neworderestimtedrevenue}    xpath=//div[@class='new-orders-preview-container']//div[1]//div[1]//div[3]//span[2]

${orderinprogress_card}    xpath=//div[@class='pending-orders-container']/div[1]
${datetime of order in-progress}    xpath=(//div[@class="pending-order-left"]//div)[1]
${patient or doctor name}    xpath=(//div[@class="pending-order-left"]//div)[2]
${pending_order_status}    xpath=(//div[@class='pending-orders-container']/div[1]//*[contains(text(),'Pending') or contains(text(),'Process') or contains(text(),'Delivered') or contains(text(),'Accepted')or contains(text(),'Redundant')or contains(text(),'Delivery Boy Assigned')or contains(text(),'Assigning Delivery Boy')])[1]

${search}    xpath=//button[normalize-space()='Search']
${select_order}    xpath=//div[@class="top-bar-search-dropdown"]
${search_card}    xpath=//button[@role='option']
${Refreshorder}    xpath=//div[@class="refresh-new-orders-btn"]


${accept_btn}    xpath=//div[@class='new-orders-preview-container']//div[1]//div[2]//div[2]//button[2]
${add_medicine}    xpath=//div[@class='medicines-header']//span[1]//*[name()='svg']
${search_medicine}    xpath=//input[@placeholder='Search Medicines']
${select_medicine}    xpath=//body/div[@id='root']/div[@id='nav-sm-bar']/div[@class='wrx-main-col']/div[@class='wrx-shell']/main[@class='wrx-content wrx-content--with-topbar bg-color']/div[@class='review-order-page-container']/div[@class='search-medicines-container-wrrapper']/div[@class='search-medicines-container-main']/div[@class='search-medicines-required-field']/div[@class='searched-medicines']/div[1]
${Add}    xpath=//button[normalize-space()='Add']
${Editmedicine}    xpath=(//div[@class="medicine-edit-container"])[1]
${clearmedicine}    xpath=//input[@placeholder='Type to search medicine...']
${updatemedicine}    xpath=//button[normalize-space()='Update']
${assign_fordelivery}    xpath=//span[normalize-space()='Assign Delivery Boy']
${add_pincode}    xpath=//div[@class='patient-edit-option']//*[name()='svg']
${add_address}    xapth=//input[@placeholder='Enter Address']
${title}    xpath=//label[normalize-space()='Pincode']
${Pincode}    xpath=//input[@placeholder='Enter Pincode']
${confirm_btn}    xpath=//button[@class='confirm-btn']
${reject_btn}    xpath=//div[@class='new-orders-preview-container']//div[1]//div[2]//div[2]//button[1]
${reject_reason}    xpath=//select[@class="form-select "]
${select_reason}    xpath=(//select[@id="reject-reason-select"]//option)[2]
${address_popup}    xpath=//div[@class='address-modal']
${confirm}    xpath=(//div[@class="modal-footer"]//button)[2]
${add_discount}    xpath=//div[@class='add-discount']//span[1]//*[name()='svg']
${discount_slider}    xpath=//div[@class="slider-container"]//input
${add_btn}    xpath=//button[@class='add-btn']
${Cancel_order}    xpath=//span[normalize-space()='Cancel Order']
${Cancel_reason}    xpath=(//select[@class="cancel-order-reason-dropdown"]//option)[2]
${cancel_confirm}    xpath=//button[@class="confirm-button"]

${CANCEL}    xpath=//button[normalize-space()='Cancel']
