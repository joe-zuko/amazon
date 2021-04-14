Dado("que procuro por {string} na barra de busca e entro nos detalhes do produto") do |meu_produto|
  @busca.buscar(meu_produto)
  @resultados_page.nome_produto(meu_produto).click
end

Então("verifico se o valor de capa é o mesmo valor do box do carrinho") do
  expect(@produto_page.capa).to eql @produto_page.modal_carrinho
end

# busca infeliz

Dado("que procuro por {string} na barra de busca") do |meu_produto|
  @busca.buscar(meu_produto)
end

Então("vejo a mensagem {string}") do |achei_nada|
  expect(@resultados_page.busca_falha).to eql achei_nada
end
