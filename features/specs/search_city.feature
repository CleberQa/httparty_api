#language: pt
#uft-8

Funcionalidade: Pesquisar meteorologia por cidade
  Eu como usuário do serviços de meteorologia
  Quero pesquisar os tipos de dados metereologicos pelo nome da cidade
  Para verificar como vai estar o clima da cidade

  @city @regression
  Cenário: Consultar o clima de uma cidade
    Dado que pesquisar o clima de uma cidade
    Então apresenta o clima da "cidade" com o código 200

  @city @regression
  Cenário: Consultar cidade inexistente
    Dado que pesquisar o clima de uma cidade inexistente
    Então é exibido a mensagem "city not found" com o código 404

  @city @regression
  Cenário: Consultar cidade informando o valor vazio
    Dado que pesquisar o clima de uma cidade deixando o campo vazio
    Então é exibido a mensagem "Nothing to geocode" com o código 400

  @city @regression
  Cenário: Consultar cidade com API Key invalida
    Dado que pesquisar o clima de uma cidade com token invalido
    Então é exibido a mensagem "Invalid API key. Please see http://openweathermap.org/faq#error401 for more info." com o código 401