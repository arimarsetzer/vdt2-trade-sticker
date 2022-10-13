*** Settings ***
Documentation    Login tests

Resource        ../resources/main.resource

Test Setup        Start Test
Test Teardown     Finish Test

*** Test Cases ***

# Deve confirmar que chegou na home page
Deve validar o slogan da home page
    Do Login
    Slogan Text Should Be    Conectando colecionadores de figurinhas da copa.

# Deve confirmar que retornou para a home page
Deve voltar a home page
    Do Login
    Go To Home Page
    Slogan Text Should Be    Conectando colecionadores de figurinhas da copa.

# Não deve logar com senha incorreta e exibir toaster com notificação do erro
Não deve logar com senha incorreta
    Go To Login Page
    Submit Credentials         papito@gmail.com    abc123
    Toast Message Should Be    Credenciais inválidas, tente novamente!
    #Thinking Time
    Sleep                      1

# Deve exibir notificação toaster se a senha não for preenchida
Não deve logar se a senha não for preenchida
    Go To Login Page
    Credential Only With Email         papito@gmail.com    
    Toast Message Should Be    Por favor, informe a sua senha secreta!
    #Thinking Time
    Sleep                      1 

# Deve exibir notificação toaster se o email não for preenchido
Não deve logar se o email não for preenchido
    Go To Login Page
    Credential Only With Password         abc123    
    Toast Message Should Be    Por favor, informe o seu email!
    #Thinking Time
    Sleep                      1 

# Deve exibit notificação toaster se o email e senha não forem preenchidos
Não deve logar se as credenciais não forem preenchdias
    Go To Login Page
    Click        css=button >> text=Entrar
    Toast Message Should Be    Por favor, informe suas credenciais!
    #Thinking Time
    Sleep                      1 
