*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String
Resource   ../PageObjects/Locators/Cart_Locators.robot

*** Variables ***
@{indexsOfItemToBeAddedInCart}    ${empty}

*** Keywords ***
Add to Cart
    [Arguments]    @{indexsOfItemToBeAddedInCart}
    Set Global Variable    @{indexsOfItemToBeAddedInCart}    @{indexsOfItemToBeAddedInCart}    
    Delete all from side bar cart
    ${numberOfItems}=    Get Length    ${indexsOfItemToBeAddedInCart}
    Execute JavaScript     window.scrollTo(1,500)
    Wait Until Element Is Visible    ${addToCartBtnOnSearchResults}   
    ${buttonsOfItemsToBeAdded}=    Get WebElements    ${addToCartBtnOnSearchResults}
    Click on Add to Cart button for items to be added    ${numberOfItems}    ${indexsOfItemToBeAddedInCart}    ${buttonsOfItemsToBeAdded}
    Sleep    1
    Page Should Contain Element    ${cartSideBarOnSearchResults}
    Capture Page Screenshot    
    Return From Keyword    ${indexsOfItemToBeAddedInCart}

Validate the quantity and total price on side bar
    #${indexsOfItemToBeAddedInCart}=    Add to Cart
    Log    ${indexsOfItemToBeAddedInCart}
    ${numberOfItems}=    Get Length    ${indexsOfItemToBeAddedInCart}
    ${pricesOfItemsToBeAdded}=    Get WebElements    ${productMainPrice}
    ${sum1}=    Calulate total sum of items to be added   ${numberOfItems}    ${indexsOfItemToBeAddedInCart}    ${pricesOfItemsToBeAdded} 
    Log    ${sum1}
    ${pricesOfItemsOnSideBar}=    Get WebElements    ${eachItemPriceOnSideBar}
    ${numberOfItemsOnSideBar}=    Get Length    ${pricesOfItemsOnSideBar}
    ${sum2}=    Calulate total sum of items on side bar    ${pricesOfItemsOnSideBar}    ${numberOfItemsOnSideBar}
    Log    ${sum2}
    Should Be Equal As Numbers    ${numberOfItems}    ${numberOfItemsOnSideBar}    
    Should Be Equal As Numbers    ${sum1}    ${sum2}        

Delete all from side bar cart
    ${totalItemsToBeDeleted}    Get WebElements    ${deleteIconsOnSideBar}
    FOR    ${elements}    IN    @{totalItemsToBeDeleted}
        Click Element    ${elements}    
        Sleep    1
    END
    Capture Page Screenshot 
    
Click on Add to Cart button for items to be added
    [Arguments]    ${numberOfItems}    ${indexsOfItemToBeAddedInCart}    ${buttonsOfItemsToBeAdded}    
    FOR    ${i}   IN RANGE    0    ${numberOfItems}
        ${index}=    Get From List    ${indexsOfItemToBeAddedInCart}    ${i}
        Convert To Integer    ${index}
        ${updatedIndex}=    Evaluate    ${index}-${1}        
        ${itemToBeAddedInCart}=    Get From List    ${buttonsOfItemsToBeAdded}    ${updatedIndex}    
        Click Element   ${itemToBeAddedInCart}   
        Sleep    1        
    END
    Capture Page Screenshot 
    
Calulate total sum of items to be added
    [Arguments]    ${numberOfItems}    ${indexsOfItemToBeAddedInCart}    ${pricesOfItemsToBeAdded}
    ${sum}=    Set Variable    0
    FOR    ${i}   IN RANGE    0    ${numberOfItems}
        ${index}=    Get From List    ${indexsOfItemToBeAddedInCart}    ${i}
        Convert To Integer    ${index}
        ${updatedIndex}=    Evaluate    ${index}-${1}        
        ${prices}=    Get From List    ${pricesOfItemsToBeAdded}    ${updatedIndex}
        ${pricesText}=    Get Text    ${prices}
        ${pricesText}=    Remove String    ${pricesText}    ,
        Convert To Number    ${pricesText}    
        ${sum}=    Evaluate       ${sum}+${pricesText}
    END
    Return From Keyword    ${sum}
    
Calulate total sum of items on side bar
    [Arguments]    ${pricesOfItemsOnSideBar}    ${numberOfItemsOnSideBar}
    ${sum}=    Set Variable    0
    FOR    ${i}   IN RANGE    0    ${numberOfItemsOnSideBar}
        ${prices}=    Get From List    ${pricesOfItemsOnSideBar}    ${i}
        ${pricesText}=    Get Text    ${prices}
        ${pricesText}=    Remove String    ${pricesText}    ,
        Convert To Number    ${pricesText}
        ${sum}=    Evaluate    ${sum}+${pricesText}    
    END
    Return From Keyword    ${sum}
    