class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

cat1 = AngryCat.new(11, "Dumb")
cat2 = AngryCat.new(12, "Cool")

cat1.age
cat1.name
cat1.hiss
cat2.age
cat2.name
cat2.hiss

# When we defined our AngryCat object, we pass in variables to the class on instantiation of the new objects.
# These variables become instance variables on the class that are specific to that individual object and make these two instrance give back different information 
# Ruby calls the initialize constructor method on object creation