** Settings **
Resource        automationExercise_resources.robot
Test Setup      Contexto
Test Teardown   Fechar navegador

*** Keywords ***

** Test Cases **

Cenário 1: Verificar campos obrigatórios
    [Documentation]  Verifica se os campos obrigatórios são validados corretamente. 
    [Tags]   Test1
    Dado que o usuário está na página de Cadastro
    Quando ele preencher todos os campos obrigatórios menos o campo First name
    E clicar no botão created account
    Então o sistema verifica que o campo obrigatório não foi preenchido

Cenário 2: Verificar campos obrigatórios
    [Documentation]  Verifica se os campos obrigatórios são validados corretamente.
    [Tags]   Test2    
    Dado que o usuário está na página de Cadastro
    Quando ele preencher todos os campos obrigatórios menos o campo Last name
    E clicar no botão created account
    Então o sistema verifica que o campo obrigatório não foi preenchido

Cenário 3: Verificar campos obrigatórios
    [Documentation]  Verifica se os campos obrigatórios são validados corretamente.
    [Tags]   Test3    
    Dado que o usuário está na página de Cadastro
    Quando ele preencher todos os campos obrigatórios menos o campo Adress
    E clicar no botão created account
    Então o sistema verifica que o campo obrigatório não foi preenchido

Cenário 4: Cadastrar usuário com sucesso
    [Documentation]  Verifica se os campos obrigatórios são validados corretamente.
    [Tags]   Test4    
    Dado que o usuário está na página de Cadastro
    Quando ele preencher todos os campos obrigatórios
    E clicar no botão created account com sucesso
    Então o sistema exibe a página de cadastro com sucesso
    

   


    