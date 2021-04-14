class Carrinho < SitePrism::Page
  include Capybara::DSL

  element :botaoExcluir, "input[type='submit'][data-action='delete']"
  element :msgExcluir, ".sc-your-amazon-cart-is-empty"
  element :valorTotal, "#sc-subtotal-amount-activecart"
  element :valorTotalbox, "#sc-subtotal-amount-buybox"
  element :precoUm, "[data-item-count='1'] .sc-product-price"
  element :precoDois, "[data-item-count='2'] .sc-product-price"
  element :precoTres, "[data-item-count='3'] .sc-product-price"

  def excluir
    botaoExcluir.click
  end

  def msg_excluido
    msgExcluir.text
  end

  def soma_precos
    buscaFail.text
  end

  def preco_produtos
    precoColunas.split
  end

  def valor_total
    valorTotal.text.gsub(/[R$ .,]/, "R" "$" " " "." => "", "," => ".")
  end

  def valor_total_box
    valorTotalbox.text.gsub(/[R$ .,]/, "R" "$" " " "." => "", "," => ".")
  end

  def soma_produtos
    @preco_um = precoUm.text.split
    @preco_dois = precoDois.text.split
    @preco_tres = precoTres.text.split
    @conta = @preco_um[1].gsub(/[.,]/, "." => "", "," => ".").to_f + @preco_dois[1].gsub(/[.,]/, "." => "", "," => ".").to_f + @preco_tres[1].gsub(/[.,]/, "." => "", "," => ".").to_f
    @resultado = sprintf("%.2f", @conta)
  end
end
