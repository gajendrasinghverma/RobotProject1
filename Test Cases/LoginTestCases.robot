*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/Common/CommonFunctionalities.robot
Resource    ../Test Data/Credentials.robot
Resource    ../PageObjects/Login.robot
Test Setup    Begin Test for login    chrome
Test Teardown    End Test for login

*** Test Cases ***
Login_Functional_TestCase01
    [Documentation]    Incorrect Username. Password screen does not come until 
    ...    username is not correct hence only 1 argument    
    Set Screenshot Directory    Screenshots/Login/TestCase01
    Login with invalid user    ${invalidUsername}
 
Login_Functional_TestCase02
    [Documentation]    Incorrect Mob no. Password screen does not come 
    ...    until mob no. is not correct hence only 1 argument    
    Set Screenshot Directory    Screenshots/Login/TestCase02
    Login with invalid mobile    ${invalidMobileNumber}
     
Login_Functional_TestCase03
    [Documentation]    Incorrect Password. Password screen does not come until 
    ...    username is not correct hence 2 arguments
    Set Screenshot Directory    Screenshots/Login/TestCase03
    Login with invalid password    ${validUsername}    ${invalidPassword}
     
Login_Functional_TestCase04
    [Documentation]    Blank Username. Password screen does not come until 
    ...    username is not correct hence only 1 argument
    Set Screenshot Directory    Screenshots/Login/TestCase04
    Login with blank user    ${empty}
     
Login_Functional_TestCase05
    [Documentation]    Blank Password. Password screen does not come until 
    ...    username is not correct hence 2 arguments
    Set Screenshot Directory    Screenshots/Login/TestCase05
    Login with blank password    ${validUsername}    ${empty}
      
Login_Functional_TestCase06
    [Documentation]    Special Char User. Password screen does not come until 
    ...    username is not correct hence only 1 argument
    Set Screenshot Directory    Screenshots/Login/TestCase06
    Login with invalid user    ${invalidUsernameSpl}
    
Login_Functional_TestCase07
    [Documentation]    Correct Username and Correct Password
    Set Screenshot Directory    Screenshots/Login/TestCase07
    Login with valid user and valid password    ${validUsername}    ${validPassword}
    
Login_Functional_TestCase08
    [Documentation]    Correct Mobile number and Correct Password
    Set Screenshot Directory    Screenshots/Login/TestCase08
    Login with valid user and valid password    ${validMobileNumber}    ${validPassword}