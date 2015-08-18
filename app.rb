require('sinatra')
require('sinatra/reloader')
require('./lib/animal')
require('./lib/adopter')
also_reload('lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => "to_do"})

get("/") do
  erb(:index)
end

get("/animals") do
  
  erb(:animals)
end
