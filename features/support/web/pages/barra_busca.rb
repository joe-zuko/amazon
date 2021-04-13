class Busca < SitePrism::Page
  include Capybara::DSL

  element :barraBusca, "input#twotabsearchtextbox"

  def buscar(busca)
    barraBusca.send_keys busca, :enter
  end
end
