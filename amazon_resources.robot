*** Settings ***
Library    SeleniumLibrary
Library    XML

*** Variables ***
${URL}                    https://www.amazon.com.br/
${MENU_LIVROS}            //a[@href='/Livros/b/?ie=UTF8&node=6740748011&ref_=nav_cs_books'][contains(.,'Livros')]
${CATEGORIA_LIVROS}       (//span[@class='nav-a-content'][contains(.,'Livros')])[1]
${USUARIO}                alexandre-apr@hotmail.com
${SENHA}                  Salesiano01

*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    # Capture Page Screenshot
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

Verificar se foi para a página de resultado de pesquisa de "${PRODUTO_PESQUISADO}"  
    Wait Until Element Is Visible    locator=//a[@id='nav-logo-sprites']   
    Title Should Be    title=Amazon.com.br : ${PRODUTO_PESQUISADO}

Clicar no botão para fazer login
    Click Element    locator=//span[contains(@id,'nav-link-accountList-nav-line-1')]

Digitar o nome de usuário válido em campo de usuário e clicar em Continuar
    Wait Until Element Is Visible    locator=//input[contains(@id,'ap_email')]
    Input Text    locator=//input[contains(@id,'ap_email')]    text=${USUARIO}
    Click Element    locator=//input[contains(@id,'continue')]

Digitar senha correta correta em campo senha e clicar em Fazer Login
    Wait Until Element Is Visible    locator=//input[contains(@id,'signInSubmit')]
    Input Password    locator=//input[contains(@id,'ap_password')]    password=Salesiano01
    Click Element    locator=//input[contains(@id,'signInSubmit')]

Confirmar sucesso de acesso
    Wait Until Element Is Visible    locator=//span[contains(.,'Olá, Alexandre')]
    Element Should Be Visible    locator=//span[contains(.,'Olá, Alexandre')]

# GHERKIN STEPS - BDD
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br

Quando acessar o menu "Livros"
    Entrar no menu "Livros"
    
Então o título da página deve ficar "${TITULO}"
    Verificar se o título da página fica "${TITULO}"

E o texto "${FRASE}" deve ser exibido na página
    Verificar se aparece a frase "${FRASE}"

E a categoria "${NOME_CATEGORIA}" deve ser exibida na página
    Verificar se aparece a categoria "${NOME_CATEGORIA}"

Quando pesquisar pelo produto "${PRODUTO}"
    Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Clicar no botão de pesquisa

E um produto da linha "${PRODUTO_PESQUISADO}" deve ser mostrado na página
    Verificar se foi para a página de resultado de pesquisa de "${PRODUTO_PESQUISADO}"

Dado que eu esteja na home page da Amazon.com.br
    Go To    url=${URL}

Quando eu clicar em Olá, faça seu login
    Wait Until Element Is Visible    locator=//span[contains(@id,'nav-link-accountList-nav-line-1')]
    Click Element    locator=//span[contains(@id,'nav-link-accountList-nav-line-1')]

Então eu vejo como resultado a página de preenchimento de email de usuário
    Wait Until Element Is Visible    locator=//input[contains(@id,'ap_email')]
    Page Should Contain Element    locator=//input[contains(@id,'ap_email')]

E eu informo um email de usuário válido
    Input Text    locator=//input[contains(@id,'ap_email')]    text=${USUARIO}

E eu clico em Continuar
    Click Element    locator=//input[contains(@id,'continue')]

Então eu vejo como resultado a página de preenchimento de senha
    Wait Until Element Is Visible    locator=//input[contains(@id,'ap_password')]
    Page Should Contain Element    locator=//input[contains(@id,'ap_password')]

E eu informo uma senha válida
    Input Password    locator=//input[contains(@id,'ap_password')]    password=${SENHA}

E eu clico em Fazer Login
    Click Element    locator=//input[contains(@id,'signInSubmit')]

Então eu vejo como resultado a homepage da Amazon
    Wait Until Element Is Visible    locator=//span[contains(@id,'nav-link-accountList-nav-line-1')]
    Mouse Over    locator=//span[contains(@id,'nav-link-accountList-nav-line-1')]
    Page Should Contain    text=Sair da conta







