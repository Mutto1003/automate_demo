*** Settings ***
Library     Browser
Library     Collections
Resource    ../Resource_init.robot


*** Test Cases ***
Loop Verify แล้ว Get ค่า Text ว่าต้องเป็น String
   [Documentation]    No. 11
   ...    *** Prerequisite Steps ***
   ...    time: (15 นาที)
   ...    web: https://aisplay.ais.co.th/portal/
   ...
   ...    ***Condition***
   ...    - ใช้ Regular Expression ในการดัก Pattern
   ...    - ในขณะที่ Loop ให้ทำการ Verify ไปด้วยตามจำนวนของ Element Side menu ที่แสดงอยู่บนเว็บ โดยไม่ fig จำนวนลูป
   ...
   ...    ***Test Step Description***
   ...    1. เปิดเว็บ
   ...    2. [1] กดปุ่มแฮมเบอเกอร์เมนู
   ...
   ...    ***Expected Result***
   ...    1. [1] Loop และ Verify "Text" ของ Menu ใน Side Menu ว่าต้องเป็น String
   [Tags]    day2
   OpenChrom
   Wait For Elements State    //div[@class="auth-wrap animated fadeIn p-4 login-type"]    visible
   Login without registration
   Click    xpath=//button[@class='navbar-toggler nav-heading-toogle']
   ${elements_txt} =    Browser.Get Elements    //li//span[@class="side-bar-list-link-text"]
   Verify txt is a string    ${elements_txt}
   # Log    ${text_list}
   Sleep    5s

