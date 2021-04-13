class Produto < SitePrism::Page
  include Capybara::DSL

  element :precoCapa, "span.a-color-base .a-size-base"
  element :precoModalcarrinho, ".price3P"

  def capa
    precoCapa.text
  end

  def modal_carrinho
    precoModalcarrinho.text
  end
end
