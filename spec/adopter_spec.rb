require('spec_helper')

describe(Adopter) do
  describe('#name') do
    it('tells you its name') do
      test_adopter = Adopter.new({:name => "Jen", :phone => "5038675309", :type_preference => "cat", :breed_preference => "Turkish Angora", :id => nil})
      expect(test_adopter.name()).to(eq("Jen"))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Adopter.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds an adopter to the array of saved adopters') do
      test_adopter = Adopter.new({:name => "Jen", :phone => "5038675309", :type_preference => "cat", :breed_preference => "Turkish Angora", :id => nil})
      test_adopter.save()
      expect(Adopter.all()).to(eq([test_adopter]))
    end
  end

  describe("#==") do
    it("is the same adopter if it has the same description") do
      test_adopter1 = Adopter.new({:name => "Jen", :phone => "5038675309", :type_preference => "cat", :breed_preference => "Turkish Angora", :id => nil})
      test_adopter2 = Adopter.new({:name => "Jen", :phone => "5038675309", :type_preference => "cat", :breed_preference => "Turkish Angora", :id => nil})
      expect(test_adopter1).to(eq(test_adopter2))
    end
  end

  describe('.find') do
    it('returns an adopter by its ID') do
      test_adopter1 = Adopter.new({:name => "Jen", :phone => "5038675309", :type_preference => "cat", :breed_preference => "Turkish Angora", :id => nil})
      test_adopter1.save()
      test_adopter2 = Adopter.new({:name => "Alexa", :phone => "5035552222", :type_preference => "cat", :breed_preference => "domestic shorthair", :id => nil})
      test_adopter2.save()
      expect(Adopter.find(test_adopter2.id())).to(eq(test_adopter2))
    end
  end

  describe("#animals") do
    it("returns an array of animals for that adopter") do
      test_adopter = Adopter.new({:name => "Jen", :phone => "5038675309", :type_preference => "cat", :breed_preference => "Turkish Angora", :id => nil})
      test_adopter.save()
      test_animal1 = Animal.new({:name => "Mika", :gender => "female", :type => "cat", :breed => "Turkish Angora", :admit_date => "2015-08-01", :adopter_id => test_adopter.id()})
      test_animal1.save()
      test_animal2 = Animal.new({:name => "Quinn", :gender => "female", :type => "cat", :breed => "domestic shorthair", :admit_date => "2015-06-01", :adopter_id => test_adopter.id()})
      test_animal2.save()
      expect(test_adopter.animals()).to(eq([test_animal1, test_animal2]))
    end
  end
end
