class Animal
  attr_reader(:name, :gender, :type, :breed, :admit_date, :adopter_id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @gender = attributes.fetch(:gender)
    @type = attributes.fetch(:type)
    @breed = attributes.fetch(:breed)
    @admit_date = attributes.fetch(:admit_date)
    @adopter_id = attributes.fetch(:adopter_id)
  end

  define_singleton_method(:all) do
    returned_animals = DB.exec("SELECT * FROM animals;")
    animals = []
    returned_animals.each() do |animal|
      name = animal.fetch("name")
      gender = animal.fetch("gender")
      type = animal.fetch("type")
      breed = animal.fetch("breed")
      admit_date = animal.fetch("admit_date")
      adopter_id = animal.fetch("adopter_id").to_i()
      animals.push(Animal.new({:name => name, :gender => gender, :type => type, :breed => breed, :admit_date => admit_date, :adopter_id => adopter_id}))
    end
    animals
  end

  define_method(:save) do
    DB.exec("INSERT INTO animals (name, gender, type, breed, admit_date, adopter_id) VALUES ('#{@name}', '#{@gender}', '#{@type}', '#{@breed}', '#{@admit_date}', #{@adopter_id});")
  end

  define_method(:==) do |another_animal|
    self.name().==(another_animal.name()).&(self.adopter_id().==(another_animal.adopter_id()))
  end
  #
  # define_singleton_method(:find) do |id|
  #   found_animal = nil
  #   Animal.all().each() do |animal|
  #     if animal.id().==(id)
  #       found_animal = animal
  #     end
  #   end
  #   found_animal
  # end

end
