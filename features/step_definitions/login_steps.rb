#não autenticado

Quando("eu faço login com {string} e {string}") do |email, senha|
  @login_page.email(email)
  @login_page.senha(senha)
end

#login sucesso

Então("devo ver {string} na área logada") do |nome|
  expect(@login_page.logado).to eql nome
end

#email errado

Quando("eu faço login com {string}") do |email|
  @login_page.email(email)
end

Então("devo ver a mensagem de alerta {string}") do |mensagem|
  expect(@login_page.login_falhou).to eql mensagem
end

#email em branco

Então("recebo a mensagem {string}") do |mensagem|
  expect(@login_page.email_vazio).to have_text mensagem
end

#senha incorreta

Então("devo ver a mensagem {string}") do |mensagem|
  expect(@login_page.login_falhou).to eql mensagem
end

#senha em branco

Então("devo recebo o alerta {string}") do |mensagem|
  expect(@login_page.senha_vazia).to eql mensagem
end
