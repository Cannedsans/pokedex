require 'sinatra'
require 'poke-api-v2'

get '/' do
  @pokemons = []

  10.times do
    pkm = PokeApi.get(pokemon: rand(1..700))
    @pokemons.push(pkm)
  end

  erb :index
end

get '/pokemon/:id' do
  @pkm = PokeApi.get(pokemon: params[:id])
  erb :poke
end
