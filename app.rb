require 'sinatra'
require 'httparty'

get '/' do
  erb :index
end

get '/pokemon/:name' do
  pokemon_name = params['name']
  url = "https://pokeapi.co/api/v2/pokemon/#{pokemon_name}"

  response = HTTParty.get(url)

  if response.code == 200
    content_type :json
    response.body
  else
    status response.code
    "Erro ao obter os dados do Pokémon"
  end
end
