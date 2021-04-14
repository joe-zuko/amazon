#language: pt
@compras
Funcionalidade: Compras
    Para que eu possa comprar meus produtos
    Sendo um usuário previamente cadastrado
    Posso utilizar o carrinho de compras para finalizar meu pedido


    @add_carrinho
       Cenario: Adicionar ao Carrinho
       Dado que procuro por "Akira - Vol. 5" na barra de busca e entro nos detalhes do produto
       E também adiciono "Akira - Vol. 06" e "Akira - Vol. 3" 
       Então a soma dos produtos deve ser igual ao valor total mostrado

    @exluir_carrinho
       Cenario: Excluir Carrinho
       Dado que procuro por "Vagabond - Volume 25" na barra de busca e entro nos detalhes do produto
       Então devo excluir ele do carrinho
       E ver a mensagem "Seu carrinho da Amazon está vazio"
   
  