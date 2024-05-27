** Settings **
Library   SeleniumLibrary
Library    Collections
Library    pyautogui
Library    pytesseract   


**Variables**
${URL}          https://automationexercise.com/login
${CAMPO_NOME}   //*[@id="form"]/div/div/div[3]/div/form/input[2]
${CAMPO_EMAIL}  //*[@id="form"]/div/div/div[3]/div/form/input[3]
${BTN_SINGUP}   //*[@id="form"]/div/div/div[3]/div/form/button
${TITULO}       //*[@id="form"]/div/div/div/div[1]/h2/b[contains(.,"Enter Account Information")]
${USUARIO}      Ana Claudia
${EMAIL}        anapenereiro@gmail.com
${PASSWORD}     //*[@id="password"]
${FIRST_NAME}   //*[@id="first_name"]
${LAST_NAME}    //*[@id="last_name"]
${COMPANY}      //*[@id="company"]
${ADDRESS}      //*[@id="address1"]
${COUNTRY}      //*[@id="country"]
${STATE}        //*[@id="state"]
${CITY}         //*[@id="city"]
${ZIPCODE}      //*[@id="zipcode"]
${MOBILE_NUMBER}    //*[@id="mobile_number"]
${BTN_CREATED_ACCOUNT}  //*[@id="form"]/div/div/div/div[1]/form/button
${SENHA}        TESTE@123
${SOBRENOME}    TESTE
${EMPRESA}      BANCO ABC
${ENDERECO}     Rua teste, 123
${PAIS}         New Zealand
${ESTADO}       Auckland
${CIDADE}       Auckland
${CODIGO_POSTAL}    0600
${TEL_NUMBER}    649174364
${SCROLL_SCRIPT}    window.document.getElementById('${COUNTRY}').scrollIntoView(true);
${TEXTO_CREATED}    xpath=//*[@id="form"]/div/div/div/h2

**Keywords**
Contexto
    Abrir navegador
    Acessar a página automation exercise
    Preencher campo nome
    Preencher campo E-mail
    Clicar no botão Signup    
    
Abrir navegador
    Open Browser  browser=chrome
    Maximize Browser Window 

Fechar navegador
    Capture Page Screenshot
    Close Browser

Acessar a página automation exercise
    Go To   url=${URL}

Preencher campo nome    
    input text  locator=${CAMPO_NOME}  text=${USUARIO}

Preencher campo E-mail 
    input text  locator=${CAMPO_EMAIL}  text=${EMAIL}

Clicar no botão Signup
    Click Button   locator=${BTN_SINGUP}

Dado que o usuário está na página de Cadastro
    Wait Until Page Contains Element   locator=${TITULO}

Quando ele preencher todos os campos obrigatórios menos o campo First name
    Input Text    locator=${PASSWORD}     text=${SENHA}
    Input Text    locator=${LAST_NAME}    text=${SOBRENOME}
    Input Text    locator=${COMPANY}      text=${EMPRESA}
    Input Text    locator=${ADDRESS}      text=${ENDERECO}
    Scroll Element Into View    ${COUNTRY}   
    Wait Until Page Contains Element   locator=${COUNTRY}    
    Select From List By Label    ${COUNTRY}    ${PAIS}
    Input Text    locator=${STATE}       text=${ESTADO}
    Input Text    locator=${CITY}        text=${CIDADE}
    Input Text    locator=${ZIPCODE}      text=${CODIGO_POSTAL}
    Input Text    locator=${MOBILE_NUMBER}    text=${TEL_NUMBER}
   
Quando ele preencher todos os campos obrigatórios menos o campo Last name
    Input Text    locator=${PASSWORD}     text=${SENHA}
    Input Text    locator=${FIRST_NAME}    text=${USUARIO}
    Input Text    locator=${COMPANY}      text=${EMPRESA}
    Input Text    locator=${ADDRESS}      text=${ENDERECO}
    Scroll Element Into View    ${COUNTRY}   
    Wait Until Page Contains Element   locator=${COUNTRY}    
    Select From List By Label    ${COUNTRY}    ${PAIS}
    Input Text    locator=${STATE}       text=${ESTADO}
    Input Text    locator=${CITY}        text=${CIDADE}
    Input Text    locator=${ZIPCODE}      text=${CODIGO_POSTAL}
    Input Text    locator=${MOBILE_NUMBER}    text=${TEL_NUMBER}

Quando ele preencher todos os campos obrigatórios menos o campo Adress
    Input Text    locator=${PASSWORD}     text=${SENHA}
    Input Text    locator=${FIRST_NAME}    text=${USUARIO}
    Input Text    locator=${LAST_NAME}    text=${SOBRENOME}
    Input Text    locator=${COMPANY}      text=${EMPRESA}
    Scroll Element Into View    ${COUNTRY}   
    Wait Until Page Contains Element   locator=${COUNTRY}    
    Select From List By Label    ${COUNTRY}    ${PAIS}
    Input Text    locator=${STATE}       text=${ESTADO}
    Input Text    locator=${CITY}        text=${CIDADE}
    Input Text    locator=${ZIPCODE}      text=${CODIGO_POSTAL}
    Input Text    locator=${MOBILE_NUMBER}    text=${TEL_NUMBER}

Quando ele preencher todos os campos obrigatórios
    Input Text    locator=${PASSWORD}     text=${SENHA}
    Input Text    locator=${FIRST_NAME}    text=${USUARIO}
    Input Text    locator=${LAST_NAME}    text=${SOBRENOME}
    Input Text    locator=${COMPANY}      text=${EMPRESA}
    Input Text    locator=${ADDRESS}      text=${ENDERECO}
    Scroll Element Into View    ${COUNTRY}   
    Wait Until Page Contains Element   locator=${COUNTRY}    
    Select From List By Label    ${COUNTRY}    ${PAIS}
    Input Text    locator=${STATE}       text=${ESTADO}
    Input Text    locator=${CITY}        text=${CIDADE}
    Input Text    locator=${ZIPCODE}      text=${CODIGO_POSTAL}
    Input Text    locator=${MOBILE_NUMBER}    text=${TEL_NUMBER}

E clicar no botão created account
    Click Button    locator=${BTN_CREATED_ACCOUNT}
    Wait Until Page Contains Element    ${FIRST_NAME}

E clicar no botão created account com sucesso
    Click Button    locator=${BTN_CREATED_ACCOUNT}
    Wait Until Page Contains Element    ${TEXTO_CREATED} 

Então o sistema exibe a página de cadastro com sucesso
   ${element_text}=    Get Text    ${TEXTO_CREATED} 
    Should Be Equal As Strings    ${element_text.lower()}    account created!


Então o sistema verifica que o campo obrigatório não foi preenchido

    ${first_name_value}=    Execute JavaScript    return document.querySelector("#first_name").value
    ${last_name_value}=    Execute JavaScript    return document.querySelector("#last_name").value
    ${address_value}=    Execute JavaScript    return document.querySelector("#address1").value

    Run Keyword If    '${first_name_value}' == '' or '${last_name_value}' == '' or '${address_value}' == ''    Log    Preencha todos os campos obrigatórios
    ...    ELSE    Log    Todos os campos obrigatórios foram preenchidos
