require('rspec')
require('pg')
require('animal')
# require('adopter')

DB = PG.connect({:dbname => "shelter_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM animals *;")
    DB.exec("DELETE FROM adopters *;")
  end
end
