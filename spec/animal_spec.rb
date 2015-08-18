require('spec_helper')

describe(Animal) do
  describe('#name') do
    it('tells you its name') do
      test_animal = Animal.new({:name => "Mika", :gender => "female", :type => "cat", :breed => "Turkish Angora", :admit_date => "2015-08-01", :id => nil})
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
      test_animal = Animal.new({:name => "Mika", :gender => "female", :type => "cat", :breed => "Turkish Angora", :admit_date => "2015-08-01", :id => nil})
      test_animal.save()
      expect(Animal.all()).to(eq([test_animal]))
    end
  end

  describe("#==") do
    it("is the same animal if it has the same description") do
      test_animal1 = Animal.new({:name => "Mika", :gender => "female", :type => "cat", :breed => "Turkish Angora", :admit_date => "2015-08-01", :id => nil})
      test_animal2 = Animal.new({:name => "Mika", :gender => "female", :type => "cat", :breed => "Turkish Angora", :admit_date => "2015-08-01", :id => nil})
      expect(test_animal1).to(eq(test_animal2))
    end
  end

end
