*** Settings ***
Library    SeleniumLibrary
Resource   ../PageObjects/Locators/Checkout_Locators.robot
Resource    ../Test Data/Address.robot

*** Keywords ***
Go to cart from side bar
    Click Element    ${goToCartOnSearchResults} 
    Wait Until Element Is Visible    ${proceedToCheckout}  
    
Go to cart from main cart
    Click Element    ${goToCartMain}   
    Wait Until Element Is Visible    ${proceedToCheckout} 
    
Go to address page
    Click Element    ${proceedToCheckout} 
    Wait Until Element Is Visible    ${addressSection} 
    
Select address and go to Payments page
    Click Element   ${addressRadioButton} 
    Click Element    ${useThisAddress}
    Wait Until Element Is Visible    ${selectPaymentMethod}          
    
Add new address
    Click Element    ${addNewAddress}    
    Sleep    1
    Input Text    ${addressName}    ${name} 
    Input Text    ${addressMob}    ${mobileNumber}
    Input Text    ${addressPin}    ${pinCode} 
    Input Text    ${addressHouse}    ${houseNumber} 
    Input Text    ${addressArea}    ${area}   
    Click Element    ${saveNewAddress}  
    Wait Until Element Is Visible    ${addressSection}       
           
Checkout from side bar with existing address
    Go to cart from side bar
    Go to address page
    Select address and go to Payments page
    Sleep    1
    
Checkout from side bar with new address
    Go to cart from side bar
    Go to address page
    Add new address
    Select address and go to Payments page
    Sleep    1
    
Checkout from main cart with existing address
    Go to cart from main cart
    Go to address page
    Select address and go to Payments page
    Sleep    1
    
Checkout from main cart with new address
    Go to cart from main cart
    Go to address page
    Add new address
    Select address and go to Payments page
    Sleep    1
    
    
    