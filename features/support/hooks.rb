Before do
  page.current_window.resize_to(1440, 900)
  visit "/"
  @busca = Busca.new
  @resultados_page = Resultados.new
  @produto_page = Produto.new
  @login_page = Login.new
end

Before ("@login") do
  @login_page.load
end

Before ("@compras") do
  @carrinho_page = Carrinho.new
end

Before ("@compra_boleto") do
  @login_page.load
  @login_page.email("contato@taekwonwikia.com.br")
  @login_page.senha("mercador20@@")
  @checkout = CheckOut.new
end
