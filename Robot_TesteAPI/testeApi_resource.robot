**** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}          https://reqres.in
${ENDPOINT_CREATE}   /api/users
${USER_DATA}         '{"name": "morpheus", "job": "leader"}'
${SESSION_ALIAS}     ReqresSession
${ENDPOINT_USER}    /api/users/2
${ENDPOINT_USER2}   /api/users/23

*** Keywords ***
Dado que os avisos de TLS estão desativados
    [Documentation]   Desativa os avisos de TLS
    Run Keyword And Ignore Error    Import Library    urllib3
    Run Keyword And Ignore Error    urllib3.disable_warnings
E Criar Sessão Para API
    Create Session    ${SESSION_ALIAS}    ${BASE_URL}

Quando enviar uma solicitação POST para criar um usuário
    [Documentation]   Envia uma solicitação POST para criar um usuário na API    
    &{headers}=   Create Dictionary    Content-Type=application/json
    ${user_data_dict}=    Evaluate    json.loads(${USER_DATA})    json
    ${response}=   POST On Session    ${SESSION_ALIAS}    ${ENDPOINT_CREATE}   json=${user_data_dict}    headers=&{headers}
    Set Test Variable    ${response}

Então o usuário é criado com sucesso
    [Documentation]    Verifica se o usuário foi criado com sucesso
    Log    ${response.status_code}

Quando enviar uma solicitação GET para obter o usuário
    [Documentation]    Envia uma solicitação GET para obter um usuário da API
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${response}=    GET On Session    ${SESSION_ALIAS}    ${ENDPOINT_USER}    headers=${headers}
    Set Test Variable    ${response}

Então o usuário retornado deve ser igual aos dados esperados
    [Documentation]    Valida o retorno da solicitação GET
    ${expected_data}=    Evaluate    {'id': 2, 'email': 'janet.weaver@reqres.in', 'first_name': 'Janet', 'last_name': 'Weaver', 'avatar': 'https://reqres.in/img/faces/2-image.jpg'}    json
    ${response_json}=    Evaluate    json.loads($response.content)    json
    Log Dictionary   ${response_json['data']}  
    Log    ${response.status_code}

Quando enviar uma solicitação PUT para atualizar o usuário
    [Documentation]    Envia uma solicitação PUT para atualizar um usuário na API
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${payload}=    Create Dictionary    name=morpheus    job=zion resident
    ${response}=    PUT On Session    ${SESSION_ALIAS}    ${ENDPOINT_USER}    json=${payload}    headers=${headers}
    Set Test Variable    ${response}

Então a atualização do usuário deve ser bem-sucedida
    [Documentation]    Verifica se a atualização do usuário foi bem-sucedida
    ${response_json}=    Evaluate    json.loads($response.content)
    Log    ${response_json}
    Log    ${response.status_code}
   

Quando enviar uma solicitação DELETE para excluir o usuário
    [Documentation]    Envia uma solicitação DELETE para excluir um usuário na API
    ${response}=    DELETE On Session    ${SESSION_ALIAS}    ${ENDPOINT_USER}
    Set Test Variable    ${response}

Então a atualização do usuário deve ser deletada com sucesso
    [Documentation]    Verifica se a atualização do usuário foi deletada com sucesso
    Log    ${response.status_code}

Quando enviar uma solicitação GET para obter o usuário após exclusão
    [Documentation]    Envia uma solicitação GET para obter um usuário após a exclusão
    ${headers}=    Create Dictionary    Content-Type=application/json    
    ${response}=    Get Request    ${SESSION_ALIAS}    ${ENDPOINT_USER2}    headers=${headers}
    Set Test Variable    ${response} 
Então o usuário não deve ser encontrado
    Log   ${response.status_code}

