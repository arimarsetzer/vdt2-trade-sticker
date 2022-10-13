*** Settings ***
Documentation    Login tests

Resource        ../resources/main.resource

Test Setup        Start Test
Test Teardown     Finish Test

*** Test Cases ***
Deve validar o slogan da home page
    Do Login
    Slogan Text Should Be    Conectando colecionadores de figurinhas da copa.

Deve voltar a home page
    Do Login
    Go To Home Page
    Slogan Text Should Be    Conectando colecionadores de figurinhas da copa.

Não deve logar com senha incorreta
    Go To Login Page
    Submit Credentials         papito@gmail.com    abc123
    Toast Message Should Be    Credenciais inválidas, tente novamente!
    #Thinking Time
    Sleep                      1

