*** Settings ***
Resource    testeApi_resource.robot 

*** Test Cases ***
Cenário: Criar um novo usuário com POST
    [Tags]    create   
    Dado que os avisos de TLS estão desativados
    E Criar Sessão Para API    
    Quando enviar uma solicitação POST para criar um usuário
    Então o usuário é criado com sucesso

Cenário: Automatizar o GET - Single User e validar o retorno
    [Tags]    get   
    Dado que os avisos de TLS estão desativados
    E Criar Sessão Para API
    Quando enviar uma solicitação GET para obter o usuário
    Então o usuário retornado deve ser igual aos dados esperados
    
Cenário: Enviar uma solicitação PUT para atualizar o usuário
     [Tags]    update  
    Dado que os avisos de TLS estão desativados
    E Criar Sessão Para API   
    Quando enviar uma solicitação PUT para atualizar o usuário
    Então a atualização do usuário deve ser bem-sucedida

Cenário: Enviar uma solicitação Delete
     [Tags]    delete 
    Dado que os avisos de TLS estão desativados
    E Criar Sessão Para API   
    Quando enviar uma solicitação DELETE para excluir o usuário
    Então a atualização do usuário deve ser deletada com sucesso

Cenário: Envia uma solicitação GET para obter um usuário após a exclusão
     [Tags]    get2
    Dado que os avisos de TLS estão desativados
    E Criar Sessão Para API   
    Quando enviar uma solicitação GET para obter o usuário após exclusão
    Então o usuário não deve ser encontrado




