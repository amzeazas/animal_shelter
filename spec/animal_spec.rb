require('spec_helper')

describe(Animal) do
  describe('#name') do
    it('tells you its name') do
      test_animal = Animal.new({:name => "Mika", :gender => "female", :type => "cat", :breed => "Turkish Angora", :admit_date => 2015-8-01})
      expect(test_animal.name()).to(eq("Mika"))
    end
  end
end
