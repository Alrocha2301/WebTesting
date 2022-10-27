*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                    https://www.amazon.com.br/
${MENU_LIVROS}            //a[@href='/Livros/b/?ie=UTF8&node=6740748011&ref_=nav_cs_books'][contains(.,'Livros')]
${CATEGORIA_LIVROS}       (//span[@class='nav-a-content'][contains(.,'Livros')])[1]

*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_LIVROS}

Entrar no menu "Livros"
    Click Element    locator=${MENU_LIVROS}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains         text=${FRASE}
    Wait Until Element Is Visible    locator=//h1[contains(.,'Loja de Livros')]

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=(//span[contains(.,'${NOME_CATEGORIA}')])[2]

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Button    locator=//input[@id='nav-search-submit-button']

Verificar se foi para a página de resultado de pesquisa    
    Wait Until Element Is Visible    locator=//a[@id='nav-logo-sprites']   
    Title Should Be    title=Amazon.com.br : Xbox Series S

Clicar no botão para fazer login
    Click Element    locator=//span[contains(@id,'nav-link-accountList-nav-line-1')]

Digitar o nome de usuário válido em campo de usuário e clicar em Continuar
    Wait Until Element Is Visible    locator=//input[contains(@id,'ap_email')]
    Input Text    locator=//input[contains(@id,'ap_email')]    text=alexandre-apr@hotmail.com
    Click Element    locator=//input[contains(@id,'continue')]

Digitar senha correta correta em campo senha e clicar em Fazer Login
    Wait Until Element Is Visible    locator=//input[contains(@id,'signInSubmit')]
    Input Password    locator=//input[contains(@id,'ap_password')]    password=Salesiano01
    Click Element    locator=//input[contains(@id,'signInSubmit')]

Confirmar sucesso de acesso
    Wait Until Element Is Visible    locator=//span[contains(.,'Olá, Alexandre')]
    Element Should Be Visible    locator=//span[contains(.,'Olá, Alexandre')]
    



