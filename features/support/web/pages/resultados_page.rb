class Resultados < SitePrism::Page
  include Capybara::DSL

  element :buscaFail, :xpath, "//*[@id='search']/div[1]/div/div[1]/div/span[3]/div[2]/div[1]/span/div/div/div[1]"
  element :botaoAddcarrinho, "#add-to-cart-button"
  element :botaoCarrinho, "#nav-cart-count-container"
  element :botaoCarrinhomodal, ".a-button-input[name='submit.addToCart']"

  def busca_falha
    buscaFail.text
  end

  def nome_produto(busca)
    find("[alt='#{busca}']")
  end

  def add_carrinho
    botaoAddcarrinho.click
  end

  def add_carrinho_modal
    botaoCarrinhomodal.click
  end

  def carrinho_go
    botaoCarrinho.click
  end
end
