*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/Common/CommonFunctionalities.robot
Resource    ../Test Data/Credentials.robot
Resource    ../PageObjects/Cart.robot
Resource    ../Test Data/SearchKeywords.robot
Resource    ../PageObjects/Search.robot
Suite Setup    Begin Test   chrome    ${validMobileNumber}    ${validPassword}
Suite Teardown    End Test

*** Test Cases ***
Cart_Functional_TestCase01
    [Documentation]    This test case is searching with random single word keyword
    ...    and then adding few items in cart from search results page itself
    ...    this test takes the sequence/index of test results as arguments
    ...    for example if user wants to add first and second item on search results
    ...    page to cart then user needs to give 1 2 with Add to Cart keyword
    Set Screenshot Directory    Screenshots/Cart/TestCase01
    Search functionality when search item is matching and available    ${singleWordSearch}
    Add to Cart    1    2
    Validate the quantity and total price on side bar
    
Cart_Functional_TestCase02
    [Documentation]    This test case is searching with random multi words keyword
    ...    and then adding few items in cart from search results page itself
    Set Screenshot Directory    Screenshots/Cart/TestCase02   
    Search functionality when search item is matching and available    ${multipleWordSearch}
    Add to Cart    1    2    3
    Validate the quantity and total price on side bar
    
Cart_Functional_TestCase03
    [Documentation]    This test case is searching with random long word keyword
    ...    and then adding few items in cart from search results page itself
    Set Screenshot Directory    Screenshots/Cart/TestCase03        
    Search functionality when search item is matching and available    ${longWordSearch}
    Add to Cart    1
    Validate the quantity and total price on side bar
    

    