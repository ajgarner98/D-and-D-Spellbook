require "sinatra"
require "sinatra/reloader"
require "http"
require "json"
require 'uri'
require 'net/http'
require 'openssl'

get("/") do
  
  @spells_API = HTTP.get("https://www.dnd5eapi.co/api/spells/")
  @spells = JSON.parse(@spells_API)
  @the_spells = @spells.fetch("results")
  
  
end
