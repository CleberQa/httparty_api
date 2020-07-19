#language: pt
#uft-8

Funcionalidade: Pesquisar meteorologia por cep
  Eu como usuário do serviços de meteorologia
  Quero pesquisar os tipos de dados metereologicos por cep
  Para verificar como vai estar o clima da cidade

  @cep @regression
  Cenário: Consultar o clima de um cep
    Dado que pesquisar o clima de um cep
    Então apresenta o clima da "cep" com o código 200

  @zipcode @regression
  Cenário: Consultar cep inexistente
    Dado que pesquisar o clima de um cep inexistente
    Então é exibido a mensagem "city not found" com o código 404

  @zipcode @regression
  Cenário: Consultar cep informando o campo vazio
    Dado que pesquisar o clima de um cep com valor vazio
    Então é exibido a mensagem "invalid zip code" com o código 400

  @zipcode @regression
  Cenário: Consultar um cep com API Key invalida
    Dado que pesquisar o clima de um cep com token invalido
    Então é exibido a mensagem "Invalid API key. Please see http://openweathermap.org/faq#error401 for more info." com o código 401