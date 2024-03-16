*** Settings ***
Library    SeleniumLibrary
Resource    ../../PageObjects/Login.robot
Resource    ../../PageObjects/Search.robot

*** Keywords ***
Begin Test for login
    [Arguments]   ${browser}    
    Set Screenshot Directory    ../Screenshots
    Create Webdriver    ${browser}    
    #Open Browser    blank:browser    ${browser}    
    Delete All Cookies
    sleep    2
    Maximize Browser Window

Begin Test
    [Arguments]    ${browser}    ${username}    ${password}
    Begin Test for login    ${browser}
    Login with valid user and valid password    ${username}    ${password}
    Sleep    1
    
# Begin Tests for cart
    # [Arguments]    ${browser}    ${username}    ${password}    ${SearchKeyword}
    # Begin Test for login    ${browser}
    # Login with valid user and valid password    ${username}    ${password}
    # Search functionality when search item is matching and available    ${SearchKeyword}
    # Sleep    1
    
End Test
    Logout
    Close Browser
    
End Test for login
    Close Browser
    
End Test for checkout
    Close Browser

      