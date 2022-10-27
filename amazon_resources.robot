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
    # Wait Until Page Contains        text=${NOME_CATEGORIA}
    # Wait Until Page Contains Element    locator=${CATEGORIA_LIVROS}
    Element Should Be Visible    locator=(//span[contains(.,'${NOME_CATEGORIA}')])[2]

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Button    locator=//input[@id='nav-search-submit-button']

Verificar se foi para a página de resultado de pesquisa    
    Wait Until Element Is Visible    locator=//a[@id='nav-logo-sprites']   
    Title Should Be    title=Amazon.com.br : Xbox Series S