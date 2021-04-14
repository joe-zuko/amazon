Dado("também adiciono {string} e {string}") do |compra_um, compra_dois|
  @resultados_page.add_carrinho
  @resultados_page.nome_produto(compra_um).hover
  @resultados_page.add_carrinho_modal
  @resultados_page.nome_produto(compra_dois).hover
  @resultados_page.add_carrinho_modal
  @resultados_page.carrinho_go
end

Então("a soma dos produtos deve ser igual ao valor total mostrado") do
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
