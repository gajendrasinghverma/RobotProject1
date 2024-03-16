*** Settings ***
Library    SeleniumLibrary
Resource   ../PageObjects/Locators/Login_Locators.robot
Resource    ../Resources/Common/CommonFunctionalities.robot

*** Keywords ***
Login with valid user and valid password
    [Arguments]    ${username}    ${password}
    Navigate to login page
    Sleep    1  
    Enter Username    ${username}  
    Capture Page Screenshot    
    Sleep    1  
    Enter Password    ${password}
    Capture Page Screenshot
    Sleep    1 
    ${max_retries}=    Set Variable    5 
    FOR    ${i}   IN RANGE    0    ${max_retries}  
        ${status}=    Run Keyword And Return Status    Page Should Contain Element    ${txt_hello_SignIn}    
        Run Keyword If    ${status}==True    Exit For Loop
        Run Keyword If     ${status}==False    Login with valid user and valid password    ${username}    ${password}  
    END
    Mouse Over    ${txt_hello_SignIn}
    Page Should Contain Element    ${element_after_login}
    Capture Page Screenshot
        
Login with invalid user
    [Arguments]    ${username}
    Navigate to login page
    Sleep    1  
    Enter Username    ${username}  
    Page Should Contain Element    ${invalidEmailElement}    
    Element Text Should Be    ${invalidEmailElement}    We cannot find an account with that email address    

Login with invalid mobile
    [Arguments]    ${mobile}
    Navigate to login page
    Sleep    1  
    Enter Username    ${mobile}  
    Page Should Contain Element    ${invalidMobileElement}    
    Element Text Should Be    ${invalidMobileElement}    We cannot find an account with that mobile number    

Login with invalid password
    [Arguments]    ${username}    ${password}
    Navigate to login page
    Sleep    1  
    Enter Username    ${username}  
    Sleep    1  
    Enter Password    ${password}
    Sleep    1
    Page Should Contain Element    ${invalidPasswordElement}    
    Element Text Should Be    ${invalidPasswordElement}    Your password is incorrect    

Login with blank user
    [Arguments]    ${username}
    Navigate to login page
    Sleep    1  
    Enter Username    ${username}  
    Page Should Contain Element    ${blankEmailElement}    
    Element Text Should Be    ${blankEmailElement}    Enter your email or mobile phone number    
    
Login with blank password
    [Arguments]    ${username}    ${password}
    Navigate to login page
    Sleep    1  
    Enter Username    ${username}  
    Sleep    1  
    Enter Password    ${password}
    Sleep    1
    Page Should Contain Element    ${blankPasswordElement}    
    Element Text Should Be    ${blankPasswordElement}    Enter your password
 
Enter Username
    [Arguments]    ${username}
    Mouse Over    ${txt_hello_SignIn} 
    Click Element    ${btn_login}
    Wait Until Page Contains Element    ${label_signin}   
    Click Element    ${input_username}    
    Input Text    ${input_username}    ${username}   
    Press Keys    ${btn_continue}    ENTER 
    
Enter Password
    [Arguments]    ${password}
    Wait Until Page Contains Element    ${input_password}
    Click Element    ${input_password}     
    Input Text    ${input_password}    ${password} 
    Select Checkbox    ${chkSigned} 
    Sleep    1
    Click Element    ${submit_btn_signin}   
    
Navigate to login page
    ${max_retries}=    Set Variable    5
    Delete All Cookies
    FOR    ${i}   IN RANGE    0    ${max_retries} 
        Go To    https://www.amazon.in
        ${status}=    Run Keyword And Return Status    Wait Until Page Contains Element    ${txt_hello_SignIn}
        Run Keyword If    ${status}==True    Exit For Loop 
        Run Keyword If     ${status}==False    Continue For Loop
    END
    
Logout
        Mouse Over    ${txt_hello_SignIn}
        Click Element    ${element_after_login} 
        Sleep    1
    