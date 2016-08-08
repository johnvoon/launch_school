module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

orange = Orange.new
hot_spicy = HotSauce.new
puts Orange.ancestors
puts "\n"
puts HotSauce.ancestors

# ancestors is a class method and not an instance method