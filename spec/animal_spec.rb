require('spec_helper')

describe(Animal) do
  describe('#name') do
    it('tells you its name') do
      test_animal = Animal.new({:name => "Mika", :gender => "female", :type => "cat", :breed => "Turkish Angora", :admit_date => 2015-8-01})
      expect(test_animal.name()).to(eq("Mika"))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Animal.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds an animal to the array of saved animals') do
      test_animal = Animal.new({:name => "Mika", :gender => "female", :type => "cat", :breed => "Turkish Angora", :admit_date => 2015-8-01})
      test_animal.save()
      expect(Animal.all()).to(eq([test_animal]))
    end
  end

end
