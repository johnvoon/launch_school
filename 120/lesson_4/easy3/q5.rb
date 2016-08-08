class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

tv = Television.new
tv.manufacturer # error because manufacturer is not defined in the Television class as an instance method but a class method. 
tv.model # the model method code will run as model is an instance method called by an instance of the Television class

Television.manufacturer # self.manufacturer class method will be invoked as the caller is the class Television
Television.model # model is an instance method in the Television class. As it is called on the Television class, there will be an error 