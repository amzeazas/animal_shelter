class Animal
  attr_reader(:name, :gender, :type, :breed, :admit_date)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @gender = attributes.fetch(:gender)
    @type = attributes.fetch(:type)
    @breed = attributes.fetch(:breed)
    @admit_date = attributes.fetch(:admit_date)
  end

  define_singleton_method(:all) do
    []
  end
end
