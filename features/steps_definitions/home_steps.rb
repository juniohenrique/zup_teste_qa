# frozen_string_literal: true

######### DADO #########
Dado('que eu estou procurando um produto') do
  home.load
end

######### QUANDO #########
Quando('eu busco {string}') do |_produto|
  home.buscar_produto(_produto)
end

######### ENTAO #########
Entao('posso ver o resultado da busca') do
  expect(page).to have_css('.priceapi-finish')
end

Entao("nao posso ver o resultado da busca") do
  expect(page).to have_content('não encontrou resultado algum')
end

