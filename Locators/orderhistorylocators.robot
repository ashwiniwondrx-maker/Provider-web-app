*** Variables ***

${CANCEL}    xpath=//button[normalize-space()='Cancel']
${Edit_Refill_reminder}    xpath=//span[normalize-space()='Edit Refill Reminder']
${Add_Refill_reminder}    xpath=//span[normalize-space()='Add Refill Reminder']
${selectall}    xpath=//div[@class='add-refill-reminder-medicine-select-all']//input[@type='checkbox']
${set_reminder}    xpath=//div[@class="procced-to-set-reminder-btn"]
${select_date}    xpath=(//div[@class="schedule-modal-input-box"])[1]//input
${time_dropdown}    xpath=//input[@placeholder='Select reminder time']
${confirm_reminder}    xpath=//span[normalize-space()='Confirm']
${back}    xpath=//button[@class="review-order-page-header-back-button"]
${order_history}    xpath=(//div[@class="wrx-sidebar-element"])[2]//a
${back_home}    xpath=//button[@class="btn btn-link p-0 text-decoration-none me-2"]
${order_card}    xpath=//div[@class="list-group list-group-flush"]

${delivered}    xpath=(//div[@class="fw-bold fs-5"])[1]
${order_inprogress}    xpath=(//div[@class="fw-bold fs-5"])[2]
${reject_count}    xpath=(//div[@class="fw-bold fs-5"])[3]
${expired}    xpath=(//div[@class="fw-bold fs-5"])[4]

${notify_care_executive}    xpath=//div[@class='order-actions-container']//button[1]
${upload_invoice}    xpath=//div[@class='order-actions-container']//button[2]
${upload}    xpath=//span[normalize-space()='Upload Invoice']
${patient_mobileno}    xpath=(//div[@class="patient-details-action-buttons"]//button)[1]
${close}    //button[@class='close-btn']
${patient_whatsapp}    xpath=(//div[@class="patient-details-action-buttons"]//button)[2]
${patient_Location}    xpath=(//div[@class="patient-details-action-buttons"]//button)[3]