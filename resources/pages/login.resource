*** Settings ***
Documentation    Login Page

Library    Browser

*** Keywords ***

Slogan Text Should Be
    [Arguments]    ${expected message}
    ${locator}
    ...    Set Variable
    ...    h2 >> text${expected message}

Go To Login Page
    New Page       https://trade-sticker-dev.vercel.app

Submit Credentials
    [Arguments]        ${email}    ${password}
    Fill Text    css=input[name=email]        ${email} 
    Fill Text    css=input[name=password]     ${password}
    Click        css=button >> text=Entrar

Credential Only With Email
    [Arguments]        ${email}    
    Fill Text    css=input[name=email]        ${email}
    Click        css=button >> text=Entrar

Credential Only With Password
    [Arguments]        ${password}  
    Fill Text    css=input[name=password]     ${password}
    Click        css=button >> text=Entrar

Toast Message Should Be
    [Arguments]    ${expected message}
    ${locator}
    ...    Set Variable
    ...    css=.Toastify__toast-body div >> text=${expected_message}

    Wait For Elements State        ${locator}    visible    3