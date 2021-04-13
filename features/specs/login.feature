#language: pt
@login
Funcionalidade: Login
    Para que eu possa utilizar os beneficios do site
    Sendo um usuário previamente cadastrado
    Posso acessar o sistema com o meu email e senha

    @login_ok
    Cenario: Acesso
        Quando eu faço login com "contato@taekwonwikia.com.br" e "mercador20@@"
        Então devo ver "Olá, Nico" na área logada
    
    @email_errado
    Esquema do Cenario: Email errado ou invalido
        Quando eu faço login com <email> 
        Então devo ver a mensagem de alerta <texto>

        Exemplos:
            | email                         | texto                                                               |
            | "pedefeijao@zz.com"           |  "Não encontramos uma conta associada a este endereço de e-mail"    |
            | "blankadandochoque"           |  "Não encontramos uma conta associada a este endereço de e-mail"    |
            | "kratosXnicegod.com"          |  "Não encontramos uma conta associada a este endereço de e-mail"    |

    @email_em_branco
    Cenario: Quando não coloco o email
        Quando eu faço login com ""
        Então recebo a mensagem "Digite seu e-mail ou número de telefone celular"     

    @senha_errada
    Cenario: Quando eu coloco senha errada
        Quando eu faço login com "contato@taekwonwikia.com.br" e "faaf"
        Então devo ver a mensagem "Sua senha está incorreta"

    @senha_em_branco
    Cenario: Quando uso senha em branco
        Quando eu faço login com "contato@taekwonwikia.com.br" e ""
        Então devo recebo o alerta "Insira sua senha"