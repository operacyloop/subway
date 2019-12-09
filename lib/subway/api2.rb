class Issue 
  
  #class variable...
  @@system = "Metrorail"
  
  #class variable to count... [keeps track of the number of instances of "issues"]
  @@count = 0 
  
  #class method... [only to be called on the class]
  def self.description
    puts "This is the blueprint for issues with elevators and escalators on the Metrorail. Use this to create an Issue object"
  end
  
  #class method...
  def self.count
    @@count
  end
  
  #instance method...[see? no "self"]
  def system
    @@system
  end 
  
end