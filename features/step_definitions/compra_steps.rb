Dado("que procuro por {string} na barra de busca e entro nos detalhes do produto") do |meu_produto|
  @busca.buscar(meu_produto)
  @resultados_page.nome_produto(meu_produto).click
end

# add_carrinho

Dado("verifico se o valor de capa é o mesmo valor do box do carrinho") do
  expect(@produto_page.capa).to eql @produto_page.modal_carrinho
end

Dado("também adiciono {string} e {string}") do |compra_um, compra_dois|
  @resultados_page.add_carrinho
  @resultados_page.nome_produto(compra_um).hover
  @resultados_page.add_carrinho_modal
  @resultados_page.nome_produto(compra_dois).hover
  @resultados_page.add_carrinho_modal
  @resultados_page.carrinho_go
end

Então("a soma dos produtos deve ser igual ao valor total mostrado na pagina") do
  expect(@carrinho_page.soma_produtos).to eql @carrinho_page.valor_total
  expect(@carrinho_page.valor_total).to eql @carrinho_page.valor_total_box
end

#excluir compra

Então("devo excluir ele do carrinho") do
  @resultados_page.add_carrinho
  @resultados_page.carrinho_go
  @carrinho_page.excluir
end

Então("ver a mensagem {string}") do |mensagem|
  expect(@carrinho_page.msg_excluido).to eql mensagem
end

# busca infeliz

Dado("que procuro por {string} na barra de busca") do |meu_produto|
  @busca.buscar(meu_produto)
end

Então("vejo a mensagem {string}") do |achei_nada|
  expect(@resultados_page.busca_falha).to eql achei_nada
end

# compra com boleto

Dado("que eu adiciono {string} ao meu carrinho") do |compra|
  steps %{
    Dado que procuro por "#{compra}" na barra de busca e entro nos detalhes do produto
}
  @resultados_page.add_carrinho
  @resultados_page.carrinho_go
end

Dado("fecho o pedido") do
  @carrinho_page.finalizar_compra
end

Dado("escolho o endereço que quero enviar junto com a entrega padrão") do
  @checkout.endereco
  @checkout.entrega
  @checkout.continuar
end

Quando("eu clico em pagar com boleto") do
  @checkout.boleto
  @checkout.confirmar_boleto
  @checkout.continuar
end

Então("devo ver o botão confirmar pedido") do
  @checkout.confirmar_pedido
end

Então("a soma do produto mais o frete deve ser igual ao valor total a ser pago") do
  expect(@checkout.soma_produtos).to eql @checkout.valor_total_compra
end
