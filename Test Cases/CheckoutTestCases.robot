*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/Common/CommonFunctionalities.robot
Resource    ../Test Data/Credentials.robot
Resource    ../PageObjects/Cart.robot
Resource    ../PageObjects/Checkout.robot
Resource    ../Test Data/SearchKeywords.robot
Resource    ../PageObjects/Search.robot
Suite Setup    Begin Test   Chrome    ${validMobileNumber}    ${validPassword}
Suite Teardown    End Test for checkout

*** Test Cases ***
Checkout_Functional_TestCase01
    Set Screenshot Directory    Screenshots/Checkout/TestCase01
    Search functionality when search item is matching and available    ${singleWordSearch}
    Add to Cart    1    2
    Checkout from side bar with existing address
    

Checkout_Functional_TestCase02
    Set Screenshot Directory    Screenshots/Checkout/TestCase02   
    Search functionality when search item is matching and available    ${multipleWordSearch}
    Add to Cart    1    2    3
    Checkout from side bar with existing address
    

Checkout_Functional_TestCase03
    Set Screenshot Directory    Screenshots/Checkout/TestCase03        
    Search functionality when search item is matching and available    ${longWordSearch}
    Add to Cart    1
    Checkout from side bar with existing address
    
Checkout_Functional_TestCase04
    Set Screenshot Directory    Screenshots/Checkout/TestCase01
    Search functionality when search item is matching and available    ${singleWordSearch}
    Add to Cart    1    2
    Checkout from side bar with new address
    

Checkout_Functional_TestCase05
    Set Screenshot Directory    Screenshots/Checkout/TestCase02   
    Search functionality when search item is matching and available    ${multipleWordSearch}
    Add to Cart    1    2    3
    Checkout from side bar with new address
    

Checkout_Functional_TestCase06
    Set Screenshot Directory    Screenshots/Checkout/TestCase03        
    Search functionality when search item is matching and available    ${longWordSearch}
    Add to Cart    1
    Checkout from side bar with new address
    
Checkout_Functional_TestCase07
    Set Screenshot Directory    Screenshots/Checkout/TestCase01
    Search functionality when search item is matching and available    ${singleWordSearch}
    Add to Cart    1    2
    Checkout from main cart with existing address
    

Checkout_Functional_TestCase08
    Set Screenshot Directory    Screenshots/Checkout/TestCase02   
    Search functionality when search item is matching and available    ${multipleWordSearch}
    Add to Cart    1    2    3
    Checkout from side bar with existing address
    

Checkout_Functional_TestCase09
    Set Screenshot Directory    Screenshots/Checkout/TestCase03        
    Search functionality when search item is matching and available    ${longWordSearch}
    Add to Cart    1
    Checkout from main cart with existing address
    
Checkout_Functional_TestCase10
    Set Screenshot Directory    Screenshots/Checkout/TestCase01
    Search functionality when search item is matching and available    ${singleWordSearch}
    Add to Cart    1    2
    Checkout from main cart with new address
    

Checkout_Functional_TestCase11
    Set Screenshot Directory    Screenshots/Checkout/TestCase02   
    Search functionality when search item is matching and available    ${multipleWordSearch}
    Add to Cart    1    2    3
    Checkout from main cart with new address
    

Checkout_Functional_TestCase12
    Set Screenshot Directory    Screenshots/Checkout/TestCase03        
    Search functionality when search item is matching and available    ${longWordSearch}
    Add to Cart    1
    Checkout from main cart with new address