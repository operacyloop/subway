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
  
  #this initialize method takes a default argument of a name, but also of a hash 
  #the hash is set to a default argument of an empty hash
  #passing a hash to make more stable and allow objects to be created, even with missing parameters
  def initialize(name, details={}) 
    @@count += 1
    defaults = {equipment: "unknown equipment", location: "unknown location", station: "unknown station", reason: "unknown reason", eta: "unknown return-to-service date"}
    
    #allows us to keep the defaults from the default parameters, unless there is an incoming non-nil parameter
    defaults.merge!(details)
    @name = name
    @equipment = defaults[:equipment]
    @location = defaults[:location]
    @station = defaults[:station]
    @reason = defaults[:reason]
    @eta = defaults[:eta]
  end 

end

info = {equipment: "Escalator", location: "south lawn of the White House", station: "Congress Heights Station", reason: "Minor Repair", eta: "2019-12-10"} 
a = Issue.new("Outage", info) 
p a
#b = Issue.new
#c = Issue.new

puts "The system currently has this many publicized issues:"
puts Issue.count
#puts a.system

# Would you like outages related to:
# 1. Major issues
# 2. Minor issues
# 3. Service
# 4. Upgrades
# Which outage would you like more info block_given?
# Ex: "Elevator at Congress Heights"
# Would you like "list of ____ issues or back to the main list"
