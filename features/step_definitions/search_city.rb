# frozen_string_literal: true

Dado(/^que pesquisar o clima de uma cidade$/) do
  @resposta = SearchCity.new.search_city(DATA['city']['Italy'], AUTH['authent']['token'])
end

Dado(/^que pesquisar o clima de uma cidade inexistente$/) do
  @resposta = SearchCity.new.search_city(DATA['city']['not_exist'], AUTH['authent']['token'])
end

Dado(/^que pesquisar o clima de uma cidade deixando o campo vazio$/) do
  @resposta = SearchCity.new.search_city(DATA['city']['empty'], AUTH['authent']['token'])
end

Dado(/^que pesquisar o clima de uma cidade com token invalido$/) do
  @resposta = SearchCity.new.search_city(DATA['city']['Italy'], AUTH['authent']['invalid'])
end

Então(/^é exibido a mensagem "([^"]*)" com o código (\d+)$/) do |mensagem, _codigo|
  expect(@resposta['message']).to eq mensagem
  puts "Status Code: #{@resposta.code}"
  puts "Mensagem de erro: #{@resposta['message']}"
end

Então(/^apresenta o clima da "([^"]*)" com o código (\d+)$/) do |_local, codigo|
  puts "Status Code: #{@resposta.code}"
  puts "Name da cidade: #{@resposta['name']}"
  @resposta['weather'].each do |resultado|
    puts "Previsão do tempo: #{resultado['description']}"
  end
  expect(@resposta.code).to eq codigo.to_i
  expect(@resposta.code).to eq 200
end
