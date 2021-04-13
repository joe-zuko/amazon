#language: pt

@busca
Funcionalidade: Buscar de produtos
    Para que eu possa ver os resultados de minhas buscas
    Sendo um cliente Amazon que decidiu o que commprar
    Posso usar a barra de busca para buscar o que desejo

    
    @busca_feliz
    Cenario: Buscar produto
        Dado que procuro por "Akira - Vol. 06" na barra de busca e entro nos detalhes do produto
        Então verifico se o valor de capa é o mesmo valor do box do carrinho
   
    @busca_infeliz
    Cenario: Busca não retorna nada

        Dado que procuro por "@#$@!" na barra de busca
        Então vejo a mensagem "Nenhum resultado para @#$@!."