*** Settings ***
Documentation    Arquivos principal do projeto

Library    Browser

Resource    pages/login.resource
Resource    pages/dash.resource

*** Keywords ***
Do Login
    Go To Login Page   
    Submit Credentials    papito@gmail.com    vaibrasil 
    User LoggedIn

Start Test
    New Browser    headless=False
Finish Test
    Take Screenshot