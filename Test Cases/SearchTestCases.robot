*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/Common/CommonFunctionalities.robot
Resource    ../Test Data/Credentials.robot
Resource    ../PageObjects/Search.robot
Resource    ../Test Data/SearchKeywords.robot
Suite Setup    Begin Test   chrome    ${validUsername}    ${validPassword}
Suite Teardown    End Test

*** Test Cases ***
Search_Functional_TestCase01
    [Documentation]    Testing Search Functionality by giving random single word search
    ...    keyword
    Set Screenshot Directory    Screenshots/Search/TestCase01
    Search functionality when search item is matching and available    ${singleWordSearch}
    
Search_Functional_TestCase02
    [Documentation]    Testing Search Functionality by giving random multple word 
    ...    search keyword 
    Set Screenshot Directory    Screenshots/Search/TestCase02   
    Search functionality when search item is matching and available    ${multipleWordSearch}
    
Search_Functional_TestCase03
    [Documentation]    Testing Search Functionality by giving random very long word 
    ...    search keyword 
    Set Screenshot Directory    Screenshots/Search/TestCase03        
    Search functionality when search item is matching and available    ${longWordSearch}
    
Search_Functional_TestCase04
    [Documentation]    Testing Search Functionality by giving random keyword for which there
    ...    are no matching results but still some results are listed
    Set Screenshot Directory    Screenshots/Search/TestCase04
    Search functionality when search item is not matching    ${noMatchSearch}
    
Search_Functional_TestCase05
    [Documentation]    Testing Search Functionality by giving random keyword for which there
    ...    are no matching results at all
    Set Screenshot Directory    Screenshots/Search/TestCase05
    Search functionality when no results are found    ${noResultSearch}