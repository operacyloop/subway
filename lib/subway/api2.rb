class Issue 
  
  #allowing for read-write to all the folloing variables:
  attr_accessor :name, :equipment, :location, :station, :reason, :eta
  
  #class variable...
  @@system = "Metrorail"
  
  #class variable to count... [keeps track of the number of instances of "issues"]
  @@count = 0 
  
  #class method... [only to be called on the class]
  def self.description
    puts "This is the blueprint for issues with elevators and escalators on the Metrorail, the Washington DC subway system. Use this to create an Issue object"
  end
  
  #class method...
  def self.count
    @@count
  end
  
  #instance method...[see? no "self"]
  def system
    @@system
  end 
  
  def initialize(name, details) 
    @@count += 1
    @name = name
    @equipment = details[:equipment]
    @location = details[:location]
    @station = details[:station]
    @reason = details[:reason]
    @eta = details[:eta]
  end 

end

info = {equipment: "Escalator", location: "south lawn of the White House", station: "Congress Heights Station", reason: "Minor Repair", eta: "2019-12-10"} 
a = Issue.new("Outage", info) 
#b = Issue.new
#c = Issue.new

puts "The system currently has this many publicized issues:"
puts Issue.count
#puts a.system
