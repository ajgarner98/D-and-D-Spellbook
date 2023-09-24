require "sinatra"
require "sinatra/reloader"
require "http"
require "json"
require 'uri'
require 'net/http'
require 'openssl'
require "sinatra/cookies"

get("/") do
  
  @spells_API = HTTP.get("https://www.dnd5eapi.co/api/spells/")
  @spells = JSON.parse(@spells_API)
  @the_spell_index = @spells.fetch("results")
  @spell_list = @the_spell_index
  #@spell_names = @spell_hash.fetch("name")
  
  erb(:home)
end

get("/:description") do
  @described = params.fetch("description")
  @spell_description_API = HTTP.get("https://www.dnd5eapi.co/api/spells/#{@described}")
  @the_description = JSON.parse(@spell_description_API)
 

  erb(:description)
end

get("/:saved_spell/favorites") do
  @favored = params.fetch("saved_spell")
  @fav_index = 1
  @fav_index_string = @fav_index.to_s
  cookies[@fav_index_string] = @favored
  @stored_favs = cookies[@fav_index_string]
  @fav_index = @fav_index + 1
  erb(:favorite)
end
