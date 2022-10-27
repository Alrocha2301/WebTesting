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
    Acessar a home page do site Amazon.com.br
    Entrar no menu "Livros"
    Verificar se aparece a frase "Loja de Livros"
    Verificar se o título da página fica "Livros | Amazon.com.br"
    Verificar se aparece a categoria "Livros"

Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]             busca_produtos    lista_da_busca
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar se foi para a página de resultado de pesquisa