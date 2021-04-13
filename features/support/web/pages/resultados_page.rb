class Resultados < SitePrism::Page
  include Capybara::DSL

  element :buscaFail, :xpath, "//*[@id='search']/div[1]/div/div[1]/div/span[3]/div[2]/div[1]/span/div/div/div[1]"

  def busca_falha
    buscaFail.text
  end

  def nome_produto(busca)
    find("[alt='#{busca}']").click
  end
end
