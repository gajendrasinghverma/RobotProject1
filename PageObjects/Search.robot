*** Settings ***
Library    SeleniumLibrary
Library    String
Resource   ../PageObjects/Locators/Search_Locators.robot

*** Keywords ***
Search functionality when search item is matching and available
    [Arguments]    ${SearchKeyword}
    Perform Search and display search results    ${SearchKeyword}
    Capture Page Screenshot    
    Wait Until Page Contains Element    ${searchRefinementBar}
    Wait Until Page Contains Element    ${searchResultsText}    
    Scroll Element Into View    ${searchResultsComponent}
    ${search_results}=    Get WebElements    ${searchResultsComponent}
    Should Not Be Empty    ${search_results}  
    FOR    ${result}    IN    @{search_results}
        Split Search Keyword by space and validate match    ${SearchKeyword}    ${result}
        ${status}=    Run Keyword And Return Status    Get Element Attribute    ${searchResultsComponent}    img
        Should Be Equal As Strings    ${status}    True       
    END

Search functionality when search item is not matching
    [Arguments]    ${SearchKeyword}
    Perform Search and display search results    ${SearchKeyword}
    Capture Page Screenshot
    Wait Until Page Contains Element    ${searchRefinementBar}
    Wait Until Page Contains Element    ${searchResultsText}
    Scroll Element Into View    ${searchResultsComponent}
    ${search_results}=    Get WebElements    ${searchResultsComponent}
    Should Not Be Empty    ${search_results}  
    FOR    ${result}    IN    @{search_results}
        Split Search Keyword by space and validate unmatch    ${SearchKeyword}    ${result}
        ${status}=    Run Keyword And Return Status    Get Element Attribute    ${searchResultsComponent}    img
        Should Be Equal As Strings    ${status}    True       
    END    
    
Search functionality when no results are found
    [Arguments]    ${SearchKeyword}
    Perform Search and display search results    ${SearchKeyword}
    Capture Page Screenshot
    Sleep    1
    Page Should Not Contain Element    ${searchResultsText}
    ${search_results}=    Get WebElements    ${searchResultsComponent}
    Should Be Empty    ${search_results}  
    Sleep    1
    Page Should Contain Element    ${noResultsText1}
    Page Should Contain Element    ${noResultsText2} 
    Page Should Contain Element    ${noResultsText3}
    Page Should Contain Element    ${helpElement}
    Page Should Contain Element    ${contactElement}      
     
Perform Search and display search results
        [Arguments]    ${SearchKeyword}
        Click Element    ${searchBox}
        Clear Element Text    ${searchBox}   
        Sleep    1 
        Input Text    ${searchBox}    ${SearchKeyword}    
        Sleep    1
        Click Element    ${searchButton}
        
Split Search Keyword by space and validate match
    [Arguments]    ${SearchKeyword}    ${result} 
    ${searchText_parts}=    Split String    ${SearchKeyword}   
    FOR    ${text}    IN    @{searchText_parts}
        ${status}=    Run Keyword And Return Status    Should Contain    ${result.text}    ${text}     ignore_case=True
        Run Keyword If    ${status}==True    Exit For Loop 
        Run Keyword If    ${status}==True    Element Should Contain    ${searchResultsDescription}    ${text}    ignore_case=True
        Run Keyword If     ${status}==False    Continue For Loop
    END
    
Split Search Keyword by space and validate unmatch
    [Arguments]    ${SearchKeyword}    ${result} 
    ${searchText_parts}=    Split String    ${SearchKeyword}   
    FOR    ${text}    IN    @{searchText_parts}
        Should Not Contain    ${result.text}    ${text}     ignore_case=True
    END