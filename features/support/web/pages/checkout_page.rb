class CheckOut < SitePrism::Page
  include Capybara::DSL

  element :botaoEndereco, "#address-book-entry-0 .ship-to-this-address"
  element :botaoEntrega, ".a-last"
  element :botaoContinuar, :xpath, "//*[@id='shippingOptionFormId']/div[3]/div/div/span[1]/span/input"
  element :botaoBoleto, "label [type='radio']"
  element :botaoContinuar2, :xpath, "/html/body/div[5]/div[1]/div[2]/div[2]/div/div[2]/div[1]/form/div[2]/div/div/div/span/span/input"
  element :botaoConfirmarpedido, "#placeYourOrder input[title='Confirmar pedido']"
  element :pedidoTotal, "#subtotals-marketplace-table [data-testid=''] .a-size-medium.a-text-right"
  element :pedidoValor, :xpath, "//*[@id='subtotals-marketplace-table']/tbody/tr[1]/td[2]"
  element :freteValor, :xpath, "//*[@id='subtotals-marketplace-table']/tbody/tr[2]/td[2]"
  element :descontoProduto, :xpath, "//*[@id='subtotals-marketplace-table']/tbody/tr[4]/td[2]"

  def endereco
    botaoEndereco.click
  end

  def entrega
    botaoEntrega.set(true)
  end

  def continuar
    botaoContinuar.click
  end

  def boleto
    botaoBoleto.click
  end

  def confirmar_boleto
    botaoContinuar2.click
  end

  def confirmar_pedido
    botaoConfirmarpedido.hover
  end

  def valor_total_compra
    pedidoTotal.text.gsub(/[R$ .,]/, "R" "$" " " "." => "", "," => ".")
  end

  def soma_produtos
    pedido = pedidoValor.text.split.select { |numeros| numeros.to_f >= 1 }
    frete = freteValor.text.split.select { |numeros| numeros.to_f >= 1 }
    desconto = descontoProduto.text.split.select { |numeros| numeros.to_f >= 1 }

    if page.has_text?("Promoção aplicada:")
      puts @conta = (pedido[0].gsub(/[.,]/, "." => "", "," => ".").to_f + frete[0].gsub(/[.,]/, "." => "", "," => ".").to_f) - frete[0].gsub(/[.,]/, "." => "", "," => ".").to_f
    else
      puts @conta = pedido[0].gsub(/[.,]/, "." => "", "," => ".").to_f + frete[0].gsub(/[.,]/, "." => "", "," => ".").to_f
    end

    @resultado = sprintf("%.2f", @conta)
  end
end
