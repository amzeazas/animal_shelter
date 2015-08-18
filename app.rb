require('sinatra')
require('sinatra/reloader')
require('./lib/animal')
require('./lib/adopter')
also_reload('lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => "shelter"})

get("/") do
  erb(:index)
end

get("/animals") do
  @animals = Animal.all()
  erb(:animals)
end

post("/animals") do
  animal = Animal.new({:name => params.fetch("name"), :gender => params.fetch("gender"), :type => params.fetch("type"), :breed => params.fetch("breed"), :admit_date => params.fetch("admit_date"), :adopter_id => params.fetch("adopter_id")})
  animal.save()
  erb(:animal_success)
end
