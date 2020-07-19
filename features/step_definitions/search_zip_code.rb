# frozen_string_literal: true

Dado(/^que pesquisar o clima de um cep$/) do
  @resposta = SearchZip.new.search_zip_code(DATA['zip']['zipcode'], DATA['zip']['country'], AUTH['authent']['token'])
end

Dado(/^que pesquisar o clima de um cep inexistente$/) do
  @resposta = SearchZip.new.search_zip_code(DATA['zip']['not_exist'], DATA['zip']['country'], AUTH['authent']['token'])
end

Dado(/^que pesquisar o clima de um cep com valor vazio$/) do
  @resposta = SearchZip.new.search_zip_code(DATA['zip']['empty'], DATA['zip']['country'], AUTH['authent']['token'])
end

Dado(/^que pesquisar o clima de um cep com token invalido$/) do
  @resposta = SearchZip.new.search_zip_code(DATA['zip']['zipcode'], DATA['zip']['country'], AUTH['authent']['invalid'])
end
