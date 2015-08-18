class Adopter
  attr_reader(:name, :phone, :type_preference, :breed_preference, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @phone = attributes.fetch(:phone)
    @type_preference = attributes.fetch(:type_preference)
    @breed_preference = attributes.fetch(:breed_preference)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_adopters = DB.exec("SELECT * FROM adopters;")
    adopters = []
    returned_adopters.each() do |adopter|
      name = adopter.fetch("name")
      phone = adopter.fetch("phone")
      type_preference = adopter.fetch("type_preference")
      breed_preference = adopter.fetch("breed_preference")
      id = adopter.fetch("id").to_i()
      adopters.push(Adopter.new({:name => name, :phone => phone, :type_preference => type_preference, :breed_preference => breed_preference, :id => id}))
    end
    adopters
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO adopters (name, phone, type_preference, breed_preference) VALUES ('#{@name}', '#{@phone}', '#{@type_preference}', '#{@breed_preference}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_adopter|
    self.name().==(another_adopter.name()).&(self.id().==(another_adopter.id()))
  end

  define_singleton_method(:find) do |id|
    found_adopter = nil
    Adopter.all().each() do |adopter|
      if adopter.id().==(id)
        found_adopter = adopter
      end
    end
    found_adopter
  end

  define_method(:animals) do
    adopter_animals = []
    animals = DB.exec("SELECT * FROM animals WHERE adopter_id = #{self.id()};")
    animals.each() do |animal|
      description = animal.fetch("description")
      adopter_id = animal.fetch("adopter_id").to_i()
      adopter_animals.push(Task.new({:description => description, :adopter_id => adopter_id}))
    end
    adopter_animals
  end

end
