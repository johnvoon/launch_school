# boolean_regex.rb

def has_a_b?(string) #method to check if a string (passed as argument) has a b in it
    if string =~ /b/
      puts "We have a match!"
    else 
      puts "No match here."
    end
  end

  has_a_b?("basketball")
  has_a_b?("football")
  has_a_b?("hockey")
  has_a_b?("golf")