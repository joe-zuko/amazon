class Login < SitePrism::Page
  include Capybara::DSL

  element :emailField, "input[name='email']"
  element :passField, "input#ap_password"
  element :loginField, "#nav-link-accountList-nav-line-1"
  element :alertaFalhou, ".a-list-item"
  element :emailBranco, "#auth-email-missing-alert"
  element :senhaVazia, "#auth-password-missing-alert"

  def load
    visit "https://www.amazon.com.br/ap/signin?openid.pape.max_auth_age=0&openid.return_to=https%3A%2F%2Fwww.amazon.com.br%2Fref%3Dnav_signin&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.assoc_handle=brflex&openid.mode=checkid_setup&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0&"
  end

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
