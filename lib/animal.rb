class Animal
  attr_reader(:name, :gender, :type, :breed, :admit_date, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @gender = attributes.fetch(:gender)
    @type = attributes.fetch(:type)
    @breed = attributes.fetch(:breed)
    @admit_date = attributes.fetch(:admit_date)
    @id = attributes.fetch(:id)
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
      id = animal.fetch("id").to_i()
      animals.push(Animal.new({:name => name, :gender => gender, :type => type, :breed => breed, :admit_date => admit_date, :id => id}))
    end
    animals
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO animals (name, gender, type, breed, admit_date) VALUES ('#{@name}', '#{@gender}', '#{@type}', '#{@breed}', '#{@admit_date}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_animal|
    self.name().==(another_animal.name()).&(self.id().==(another_animal.id()))
  end

end
