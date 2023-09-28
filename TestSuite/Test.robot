*** Settings ***
Library     Browser
Library     Collections
Resource    ../Resource_init.robot


*** Test Cases ***
Verify All Side Menu
    # [Documentation]    No. 1
    # ...    ***Test Step Description***
    # ...    1. เปิดเว็บ
    # ...    2. กดปุ่มแฮมเบอเกอร์เมนู
    # ...    3. Verify all Element side menu
    OpenChrom
    Log    message
    # Wait For Elements State    //div[@class="auth-wrap animated fadeIn p-4 login-type"]    visible
    # Login without registration
    # Click    xpath=//button[@class='navbar-toggler nav-heading-toogle']
    # Verify all Element side menu
    # Sleep    5s
   

# Verify Open Live TV Page
#     [Documentation]    No. 2
#     ...    ***Test Step Description***
#     ...    1. เปิดเว็บ
#     ...    2. กดปุ่มแฮมเบอเกอร์เมนู
#     ...    3. Verify all Element side menu
#     ...    4. กดเลือกเมนู ทีวี
#     ...    5. Verify Live TV Page(พอสังเขป) > ต้องเห็นคำว่า "ผังรายการทีวี" หรือ "TV Program Guides"
#     OpenChrom
#     Wait For Elements State    //div[@class="auth-wrap animated fadeIn p-4 login-type"]    visible
#     Login without registration
#     Click    xpath=//button[@class='navbar-toggler nav-heading-toogle']
#     Verify all Element side menu
#     Click    xpath=//li[@class='side-bar-list-item' and a/span[contains(text(), 'ทีวี')]]
#     Verify Live TV Page
#     Sleep    5s

# Verify Invalid OTP (TH)
#     [Documentation]    No. 3
#     ...    ***Test Step Description***
#     ...    1. เปิดเว็บ
#     ...    2. กดปุ่ม เข้าสู่ระบบ
#     ...    3. กรอกเบอร์: 0123456789
#     ...    4. กด รับรหัส OTP
#     ...    5. กรอก opt: 1234
#     ...    6. Verify Alert msg "รหัส OTP ไม่ถูกต้อง กรุณาระบุใหม่อีกครั้ง"
#     OpenChrom
#     Wait For Elements State    //div[@class="auth-wrap animated fadeIn p-4 login-type"]    visible
#     Login User    0123456783    1234
#     Wait For Elements State    //div//span[contains(text(), 'รหัส OTP ไม่ถูกต้อง กรุณาระบุใหม่อีกครั้ง')]
#     Sleep    5s

# Verify Invalid OTP (EN)
#     [Documentation]    No. 4
#     ...    ***Test Step Description***
#     ...    1. เปิดเว็บ
#     ...    2. กดปุ่ม เข้าสู่ระบบ
#     ...    3. กดปุ่ม EN
#     ...    4. กรอกเบอร์: 0123456789
#     ...    5. กด รับรหัส OTP
#     ...    6. กรอก opt: 1234
#     ...    7. Verify Alert msg "You have entered incorrect OTP. Please try again."
#     OpenChrom
#     Wait For Elements State    //div[@class="auth-wrap animated fadeIn p-4 login-type"]    visible
#     Login User EN    0123456782    1234
#     Wait For Elements State    //div//span[contains(text(), 'You have entered incorrect OTP. Please try again.')]
#     Sleep    5s

# Verify Settings Page
#     [Documentation]    No. 5
#     ...    ***Test Step Description***
#     ...    1. เปิดเว็บ
#     ...    2. เลือกเมนู Settings
#     ...    3. Verify Settings Page (Thai)
#     ...    4. เลือกภาษา เป็น English
#     ...    5. Verify Settings Page (English)
#     OpenChrom
#     Wait For Elements State    //div[@class="auth-wrap animated fadeIn p-4 login-type"]    visible
#     Login without registration
#     Click    xpath=//button[@class='navbar-toggler nav-heading-toogle']
#     Verify all Element side menu
#     Click    xpath=//li[@class='side-bar-list-item' and a/span[contains(text(), 'ตั้งค่า')]]
#     Verify Settings Page TH
#     Click    //div[@class="container-fluid px-0"]//div[4]//button[@class="language-select"]
#     Verify Settings Page EN
#     Sleep    5s

# Verify search not found
#     [Documentation]    No. 6
#     ...    ***Test Step Description***
#     ...    1. เปิดเว็บ
#     ...    2. ค้นหา test123456789
#     ...    3. Verify ในหัวข้อ Movies ต้องแสดง msg > ไม่พบ "Movies" ไม่ได้เลือกหมวด:test123456789
#     OpenChrom
#     Wait For Elements State    //div[@class="auth-wrap animated fadeIn p-4 login-type"]    visible
#     Login without registration
#     Click    //button[@class="btn form-search-btnsearch not-focusable rounded-left"]
#     Wait For Elements State    //input[@class="form-control form-search-input-form"]    visible
#     Type Text    //input[@class="form-control form-search-input-form"]    test123456789
#     Click    //button[@class="btn form-search-btnsearch not-focusable active"]
#     Verify Error msg
#     Sleep    5s

# Verify search and movie page
#     [Documentation]    No. 7
#     ...    ***Test Step Description***
#     ...    1. เปิดเว็บ
#     ...    2. ค้นหา ดรีมทีม
#     ...    3. Verify ว่าในหัวข้อ Movies ต้องมีหนังเรื่อง ดรีมทีม
#     ...    > ถ้ามีให้กดที่ Poster หรือ Name
#     ...    > ถ้าไม่มีให้แสดง msg error ใน log ว่า "กรุณาเช็ค Movies ของคุณอีกครั้งจ้า"
#     ...    4.Verify Movie Page(เช็คชื่อหนังว่าเปิดเรื่องที่เรากดมา)
#     OpenChrom
#     Wait For Elements State    //div[@class="auth-wrap animated fadeIn p-4 login-type"]    visible
#     Login without registration
#     Click    //button[@class="btn form-search-btnsearch not-focusable rounded-left"]
#     Wait For Elements State    //input[@class="form-control form-search-input-form"]    visible
#     Type Text    //input[@class="form-control form-search-input-form"]    ดรีมทีม
#     Click    //button[@class="btn form-search-btnsearch not-focusable active"]

#     # ${elements} =    Browser.Get Elements    //section[@id="movies"]//div[@class="carusel-data-column"]
#     ${elements} =    Browser.Get Elements    //section[@id="movies"]//div[@class="carusel-data-column"]
#     # ${element_text} =    Get Text    ${elements}
#     # ${test}    Evaluate    random.choice($elements)
#     # Log    Selected number: ${test}
#     Log    ${elements}
#     IF    ${elements} != []
#         FOR    ${element}    IN    @{elements}
#             ${element_text} =    Get Text    ${element}
#             # Log    ${element_text}
#             ${is_contained} =    Run Keyword And Return Status    Should Contain    ${element_text}    ดรีมทีม
#             Verify Movies    ${is_contained}
#             Verify Open Movie Page    ดรีมทีม
#             IF    ${is_contained}    BREAK
#         END
#     ELSE
#         Log    กรุณาเช็ค Movies ของคุณอีกครั้งจ้า
#     END
#     Log    ${element_text}
#     Sleep    5s

# Verify Change channel is correct
#     [Documentation]    No. 8
#     ...    ***Test Step Description***
#     ...    1. เปิดเว็บ
#     ...    2. กดปุ่มแฮมเบอเกอร์เมนู
#     ...    3. กดเลือกเมนู ทีวี
#     ...    4. เปลี่ยนช่องเปนช่องใดก็ได้
#     ...    5. verify ว่าเปิดช่องถูกต้อง
#     OpenChrom
#     Wait For Elements State    //div[@class="auth-wrap animated fadeIn p-4 login-type"]    visible
#     Login without registration
#     Click    xpath=//button[@class='navbar-toggler nav-heading-toogle']
#     Verify all Element side menu
#     Click    xpath=//li[@class='side-bar-list-item' and a/span[contains(text(), 'ทีวี')]]
#     Verify Live TV Page
#     ${elements} =    Browser.Get Elements    //div[@class="row mx-0 flex-column w-100 col-12 mx-0 px-0"]
#     ${test} =    Evaluate    random.choice($elements)
#     Click    ${test}
#     ${element_text} =    Get Text    ${test}
#     ${lines} =    Evaluate    """${element_text}""".splitlines()
#     ${line_2} =    Set Variable    ${lines}[1]
#     Log    ${line_2}
#     Verify Open Page    ${line_2}
#     Sleep    5s

# # Loop แล้วทำการนับจำนวน(Count) และ Verify จำนวนของ Element บน Side Menu

# Verify All Side Menu
#     [Documentation]    No. 9
#     ...    *** Prerequisite Steps ***
#     ...    time: (15 นาที)
#     ...    web: https://aisplay.ais.co.th/portal/
#     ...
#     ...    ***Test Step Description***
#     ...    1. เปิดเว็บ
#     ...    2. กดปุ่มแฮมเบอเกอร์เมนู
#     ...    3. [1] Get All Text Element ของ Side Menu
#     ...    4. [2] Get All Icon Element ของ Side Menu
#     ...
#     ...    ***Expected Result***
#     ...    1. [1],[2] นับจำนวน(Count) ของ Element Text,Icon ที่ Get มาได้ของ Side Menu
#     ...    ---> Verify จำนวน(Count)ที่ Get มาได้ว่าต้องมี "Text" ของ Menu "12" Element และ "Icon" ของ Menu "12" Element ที่แสดงอยู่บน Side Menu
#     [Tags]    day2
#     OpenChrom
#     Wait For Elements State    //div[@class="auth-wrap animated fadeIn p-4 login-type"]    visible
#     Login without registration
#     Click    xpath=//button[@class='navbar-toggler nav-heading-toogle']
#     ${elements_icon} =    Browser.Get Elements    //li//img[@class="side-bar-list-link-icon"]
#     ${elements_icon_count} =    Get Length    ${elements_icon}
#     Log    ${elements_icon_count}
#     ${elements_txt} =    Browser.Get Elements    //li//span[@class="side-bar-list-link-text"]
#     ${elements_txt_count} =    Get Length    ${elements_txt}
#     Log    ${elements_txt_count}
#     Verify Total count menu    ${elements_icon_count}    ${elements_txt_count}
#     # Verify all Element side menu
#     Sleep    5s

# Loop Verify แล้ว Get ค่า Text ว่าห้ามเป็นค่า Null หรือ Empty แต่เป็นค่าอะไรก็ได้
#     [Documentation]    No. 10
#     ...    *** Prerequisite Steps ***
#     ...    time: (15 นาที)
#     ...    web: https://aisplay.ais.co.th/portal/
#     ...
#     ...    ***Condition***
#     ...    - ใช้ Regular Expression ในการดัก Pattern
#     ...    - ในขณะที่ Loop ให้ทำการ Verify ไปด้วยตามจำนวนของ Element Side menu ที่แสดงอยู่บนเว็บ โดยไม่ fig จำนวนลูป
#     ...
#     ...    ***Test Step Description***
#     ...    1. เปิดเว็บ
#     ...    2. [1] กดปุ่มแฮมเบอเกอร์เมนู
#     ...
#     ...    ***Expected Result***
#     ...    1. [1] Loop และ Verify "Text" ของ Menu ใน Side Menu ว่าห้ามเป็นค่า Null หรือ Empty แต่เป็นค่าอะไรก็ได้
#     [Tags]    day2
#     OpenChrom
#     Wait For Elements State    //div[@class="auth-wrap animated fadeIn p-4 login-type"]    visible
#     Login without registration
#     Click    xpath=//button[@class='navbar-toggler nav-heading-toogle']
#     ${elements_txt} =    Browser.Get Elements    //li//span[@class="side-bar-list-link-text"]
#     Verify Text Menu    ${elements_txt}
#     # Log    ${text_list}
#     Sleep    5s

# Loop Verify แล้ว Get ค่า Text ว่าต้องเป็น String
#    [Documentation]    No. 11
#    ...    *** Prerequisite Steps ***
#    ...    time: (15 นาที)
#    ...    web: https://aisplay.ais.co.th/portal/
#    ...
#    ...    ***Condition***
#    ...    - ใช้ Regular Expression ในการดัก Pattern
#    ...    - ในขณะที่ Loop ให้ทำการ Verify ไปด้วยตามจำนวนของ Element Side menu ที่แสดงอยู่บนเว็บ โดยไม่ fig จำนวนลูป
#    ...
#    ...    ***Test Step Description***
#    ...    1. เปิดเว็บ
#    ...    2. [1] กดปุ่มแฮมเบอเกอร์เมนู
#    ...
#    ...    ***Expected Result***
#    ...    1. [1] Loop และ Verify "Text" ของ Menu ใน Side Menu ว่าต้องเป็น String
#    [Tags]    day2
#    OpenChrom
#    Wait For Elements State    //div[@class="auth-wrap animated fadeIn p-4 login-type"]    visible
#    Login without registration
#    Click    xpath=//button[@class='navbar-toggler nav-heading-toogle']
#    ${elements_txt} =    Browser.Get Elements    //li//span[@class="side-bar-list-link-text"]
#    Verify txt is a string    ${elements_txt}
#    # Log    ${text_list}
#    Sleep    5s 

# Loop Verify ใน Side Menu และ ใช้ Break เพื่อออก Loop
#     [Documentation]    No. 12
#     ...    *** Prerequisite Steps ***
#     ...    time: (15 นาที)
#     ...    web: https://aisplay.ais.co.th/portal/
#     ...
#     ...    ***Test Step Description***
#     ...    1. เปิดเว็บ
#     ...    2. กดปุ่มแฮมเบอเกอร์เมนู
#     ...    3. [1] Loop และ Verify Side Menu
#     ...
#     ...    ***Expected Result***
#     ...    1. [1] ถ้าหาก Get Text แล้ว Value = "กีฬา" ให้ทำการ กดปุ่มปิด "X" บน Side Menu และ Break ออก Loop
#     [Tags]    day2
#     OpenChrom
#     Wait For Elements State    //div[@class="auth-wrap animated fadeIn p-4 login-type"]    visible
#     Login without registration
#     Click    xpath=//button[@class='navbar-toggler nav-heading-toogle']
#     ${elements_txt} =    Browser.Get Elements    //li//span[@class="side-bar-list-link-text"]
#     FOR    ${element}    IN    @{elements_txt}
#         ${text} =    Get Text    ${element}        
#         ${is_contained} =    Run Keyword And Return Status    Should Contain    ${text}    กีฬา       
#         IF    ${is_contained}            
#             Click    //button[@class='side-bar-title-fixed-close']
#             BREAK
#         END
#     END
#     Sleep    5s

# Click Element โดย รับค่า Arguments และไปแทนค่า Attribute "Text()" ใน Xpath
#     [Documentation]    No. 13
#     ...    *** Prerequisite Steps ***
#     ...    time: (10 นาที)
#     ...    web: https://aisplay.ais.co.th/portal/
#     ...
#     ...    ***Test Step Description***
#     ...    1. เปิดเว็บ
#     ...    2. กดปุ่มแฮมเบอเกอร์เมนู
#     ...    3. [1] กดปุ่ม Menu ใดก็ได้ บน Side Menu โดยระบุ Arguments
#     ...
#     ...    ***Expected Result***
#     ...    1. [1] ไปยังหน้า Page Menu ที่กด
#     [Tags]    day2
#     OpenChrom
#     Wait For Elements State    //div[@class="auth-wrap animated fadeIn p-4 login-type"]    visible
#     Login without registration
#     Click    xpath=//button[@class='navbar-toggler nav-heading-toogle']
#     ${elements_txt} =    Browser.Get Elements    //li//span[@class="side-bar-list-link-text"]
#     ${menu} =    Evaluate    random.choice($elements_txt)
#     Next Page Menu     ${menu}
#     Sleep    5s

# Click Element โดย รับค่า Embed และไปแทนค่า Attribute "Text()" ใน Xpath
#     [Documentation]    No. 14
#     ...    *** Prerequisite Steps ***
#     ...    time: (10 นาที)
#     ...    web: https://aisplay.ais.co.th/portal/
#     ...
#     ...    ***Test Step Description***
#     ...    1. เปิดเว็บ
#     ...    2. Setting เปลื่ยนภาษา TH/EN
#     ...    3. [1] กดปุ่ม เปลื่ยนภาษา ใดก็ได้ บน Setting Menu โดยระบุ Embed
#     ...
#     ...    ***Expected Result***
#     ...    1. [1] เปลื่ยนภาษาตาม ค่า Embed ที่โยนมา
#     [Tags]    day2
#     OpenChrom
#     Wait For Elements State    //div[@class="auth-wrap animated fadeIn p-4 login-type"]    visible
#     Login without registration
#     Click    xpath=//button[@class='navbar-toggler nav-heading-toogle']
#     Verify all Element side menu
#     Click    xpath=//li[@class='side-bar-list-item' and a/span[contains(text(), 'ตั้งค่า')]]
#     ${elements_txt} =    Browser.Get Elements    //div[@class="container-fluid px-0"]//div[4]//button        
#     ${menu} =    Evaluate    random.choice($elements_txt)
#     Language is ${menu}
#     Sleep    5s   
