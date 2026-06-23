*** Variables ***

${PROFILE}  xpath = //aside[@class='wrx-sidebar wrx-sidebar--desktop open']//i[@class='bi bi-person-circle wrx-sidebar-icon']
${PROFILEIMG}  xpath= //div[@class='owner-profile-image']//img
${PROFILENAME}  xpath= //div[@class='owner-name']
${PROFILEMOBNUMBER}  xpath= //div[@class='owner-mobile-number']
${OWNERROLE}  xpath= //div[@class='provider-role']
${ORDERACCEPTEDCARD}  xpath = //span[normalize-space()='Order(s) Accepted']
${REVENUECREATEDCARD}  xpath = //div[@class='order-stats-cards-container']//div[1]//div[2]//span[1]
${ORDERSTATSGRAPH}  xpath= //div[@class='echarts-for-react ']//div//canvas
${BUSINESSNAME}   xpath = //span[@class='business-name']
${NAVIGATETOPROFILE}  xpath = //aside[@class='wrx-sidebar wrx-sidebar--desktop open']//i[@class='bi bi-person-circle wrx-sidebar-icon']
${logout}    xpath=(//button[@class="wrx-sidebar__logout-btn"]//i)[1]
${LEAVE_ANYWAY}    xpath = //button[normalize-space()='Leave Anyway']