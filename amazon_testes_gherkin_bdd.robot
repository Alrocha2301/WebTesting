*** Settings ***
Documentation    Essa suíte testa o site da Amazon.com.br
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Livros"
    [Documentation]    Esse teste verifica o menu Livros do site Amazon.com.br
    ...                e verifica a categoria Livros
    [Tags]             menus    categorias
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Livros"
    Então o título da página deve ficar "Livros | Amazon.com.br"
    E o texto "Loja de Livros" deve ser exibido na página
    E a categoria "Livros" deve ser exibida na página

Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]             busca_produtos    lista_da_busca
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    E um produto da linha "Xbox Series S" deve ser mostrado na página

Caso de Teste 03 - Fazer Login com email e senha válidos
    [Documentation]        Esse teste verifica o login com dados de usuário válidos
    [Tags]                 login
    Dado que eu esteja na home page da Amazon.com.br
    Quando eu clicar em Olá, faça seu login
    Então eu vejo como resultado a página de preenchimento de email de usuário
    E eu informo um email de usuário válido
    E eu clico em Continuar
    Então eu vejo como resultado a página de preenchimento de senha
    E eu informo uma senha válida
    E eu clico em Fazer Login
    Então eu vejo como resultado a homepage da Amazon
