*** Settings ***
Library     Browser
Library     Collections
Library     XML
Library     BuiltIn
Library     String


*** Variables ***
# ${FULLNAME}    Administrator    #FULLNAME is a scalar variable containing the string 'Administrator'
# @{ALL USERS}    admin    hulk    dr.strange    captain    ironman    #List variable with 5 values.
# &{ADMIN}    login=admin    pwd=@RBTFRMWRK@    #Dictionary variable
# &{SPIDERMAN}    login=spider    name=Peter Parker    right=user    active=${True}


*** Keywords ***
OpenChrom
    Open Browser    https://aisplay.ais.co.th/portal/    browser=chromium

Login without registration
    Click    xpath=//button[@class='login-type-btn guest']
    # Wait For Elements State    //div[@class="auth-wrap animated fadeIn p-4 login-type"]    visible
    Click    xpath=//button[@class='accept-btn']

Verify all Element side menu
    Wait For Elements State
    ...    xpath=//a[@class='side-bar-title-fixed-logo router-link-exact-active router-link-active']/img
    ${text} =    Get Text    xpath=//li[@class='side-bar-list-item'][1]
    Log    ${text}

Verify Live TV Page
    Wait For Elements State    xpath=//div//h2/span[contains(text(), 'ผังรายการทีวี')]

Verify Error msg
    Wait For Elements State    //div//span//span[contains(text(), 'ไม่พบ "Movies" ไม่ได้เลือกหมวด:')]    visible

Login User
    [Arguments]    ${phone_number}    ${otp}
    Click    //button[@class='login-type-btn login']
    Wait For Elements State    //div[@id="main-display"]    visible
    # Log    ${phone_number}
    Wait For Elements State    //div[@id='main-display']    visible
    # Click    //img[@id='switch_lang_en']
    Type Text    //input[@id="mobileNo"]    ${phone_number}
    Click    //div[@class='request-Otp']
    Type Text    //div//input[@class='form-control text-green']    ${otp}
    Wait For Elements State    //div[@id='textwait']
    Click    //button[@id='loginbyOTP']

Login User EN
    [Arguments]    ${phone_number}    ${otp}
    Click    //button[@class='login-type-btn login']
    Wait For Elements State    //div[@id="main-display"]    visible
    # Log    ${phone_number}
    Wait For Elements State    //div[@id='main-display']    visible
    Click    //img[@id='switch_lang_en']
    Type Text    //input[@id="mobileNo"]    ${phone_number}
    Click    //div[@class='request-Otp']
    Type Text    //div//input[@class='form-control text-green']    ${otp}
    Wait For Elements State    //div[@id='textwait']
    Click    //button[@id='loginbyOTP']

Verify Settings Page TH
    # Wait For Elements State    //div[@class="container-fluid px-0"]//div[4]//button[@class="language-select language-select-active"]    visible
    Wait For Elements State    //h2/span[contains(text(), 'การตั้งค่า')]

Verify Settings Page EN
    # Wait For Elements State    //button[@class="language-select language-select-active"]    visible
    Wait For Elements State    //h2/span[contains(text(), 'Settings')]
    # เช็คคำตรงเมนูเพิ่ม กับ Login

Verify Movies
    [Arguments]    ${element}
    # ${is_contained} =    Run Keyword And Return Status    Should Contain    ${element}    ดรีมทีม
    # # Log    ${is_contained}
    IF    ${element}
        Log    พบคำว่า ทีมดับเพลิงมหากาฬ
        Click    //section[@id="movies"]//div[@class="carusel-data-column"]//h3[contains(text(), 'ดรีมทีม')]
    END

Verify Open Movie Page
    [Arguments]    ${movie}
    Wait For Elements State    //h3/span[contains(text(), '${movie}')]

Verify Open Page
    [Arguments]    ${channel}
    Wait For Elements State    //h3[contains(text(), '${channel}')]

Verify Total count menu
    [Arguments]    ${elements_icon_count}    ${elements_txt_count}
    Should Be Equal As Integers    ${elements_icon_count}    12
    Should Be Equal As Integers    ${elements_txt_count}    12

Verify Text Menu
    [Arguments]    ${elements_txt}
    FOR    ${element}    IN    @{elements_txt}
        ${menu_txt} =    Get Text    ${element}
        # IF    '${menu_txt}' != ''    Should Not Be Empty    ${menu_txt}
        Log    ${menu_txt}
        IF    '${menu_txt}' != ''    Should Not Be Empty    ${menu_txt}
    END

Verify txt is a string
    [Arguments]    ${elements_txt}
    FOR    ${element}    IN    @{elements_txt}
        ${menu_txt} =    Get Text    ${element}
        # ${menu_txt} =    Get Text    //span[@class="side-bar-list-link-text"][1]
        # IF    '${menu_txt}' != ''    Should Not Be Empty    ${menu_txt}
        # Log    ${menu_txt}
        # Should Be String    `ภาษาไทย`
        # ${menu_txt}=    Set Variable    45
        Log    ${menu_txt}
        Should Be True    isinstance('${menu_txt}', str)
        # Should Be True    isinstance(${menu_txt}, str)
    END

Next Page Menu
    [Arguments]    ${menu}
    # ${text} =    Get Text    ${menu}
    # Log    ${text}
    Click    ${menu}

Language is ${language_setting}
    ${menu_txt} =    Get Text    ${language_setting}
    Click    ${language_setting}
