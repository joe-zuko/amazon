class Login < SitePrism::Page
  include Capybara::DSL

  element :emailField, "input[name='email']"
  element :passField, "input#ap_password"
  element :loginField, "#nav-link-accountList-nav-line-1"
  element :alertaFalhou, ".a-list-item"
  element :emailBranco, "#auth-email-missing-alert"
  element :senhaVazia, "#auth-password-missing-alert"

  def email(email)
    emailField.send_keys email, :enter
  end

  def senha(senha)
    passField.send_keys senha, :enter
  end

  def logado
    loginField.text
  end

  def login_falhou
    alertaFalhou.text
  end

  def email_vazio
    emailBranco.text
  end

  def senha_vazia
    senhaVazia.text
  end
end
