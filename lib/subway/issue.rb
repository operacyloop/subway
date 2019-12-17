class Issue(name, {details}) 
  
  #allowing for read-write to all the folloing variables (aka attributes):
  attr_accessor :name, :equipment, :location, :station, :reason, :eta
  
  #class variable... 
  #@@system = "Metrorail"
  
  ##class variable to count... [keeps track of the number of instances of "issues"]
  #@@count = 0 
  
  #class method... [only to be called on the class]
  #def self.description
  #  puts "This is the blueprint for issues with elevators and escalators on the Metrorail, the Washington DC subway system. Use this to create an Issue object"
  #end
  
  #class method... [counts the objects aka the issues]
  #def self.count
  #  @@count
  #end
  
  #instance method...[see? no "self"; if there was self, this would be a class method]
  # system
  #  @@system
  # end 
  
  #this initialize method takes a default argument of a name, but also of a hash 
  #the hash is set to a default argument of an empty hash
  #passing a hash to make more stable and allow objects to be created, even with missing parameters
  def initialize(name, details={}) 
  
   # @@count += 1
   
    defaults = {equipment: "unknown equipment", location: "unknown location", station: "unknown station", reason: "unknown reason", eta: "unknown return-to-service date"}
    
    #allows us to keep the defaults from the default parameters, unless there is an incoming non-nil parameter
    
    defaults.merge!(details)
    @name = name
    @equipment = defaults[:equipment]
    @location = defaults[:location]
    @station = defaults[:station]
    @reason = defaults[:reason]
    @eta = defaults[:eta]
    @@all << self

    # puts @@count
    # puts details[:equipment]
    # puts details[:location]
    # puts details[:station]
    
    # @@all_the_issues = []
    # @@all_the_issues << details
    # puts @@all_the_issues

    #puts
  end 
  
   def self.all
    @@all
  end

issue_1 = self.new("johnson", {})
p issue_1

end



## - below is other code, eventually need to take out - ## 




# class Issue 
  
#   #allowing for read-write to all the folloing variables:
#   attr_accessor :name, :equipment, :location, :station, :reason, :eta
  
#   #class variable...
#   @@system = "Metrorail"
  
#   #class variable to count... [keeps track of the number of instances of "issues"]
#   @@count = 0 
  
#   #class method... [only to be called on the class]
  
#   def self.description
#     puts "This is the blueprint for issues with elevators and escalators on the Metrorail, the Washington DC subway system. Use this to create an Issue object"
#   end
  
#   #class method...
  
#   def self.count
#     @@count
#   end
  
#   #instance method...[see? no "self"]
#   def system
#     @@system
#   end 
  
#   #this initialize method takes a default argument of a name, but also of a hash 
#   #the hash is set to a default argument of an empty hash
#   #passing a hash to make more stable and allow objects to be created, even with missing parameters
#   def initialize(name, details={}) 
#     @@count += 1
#     defaults = {equipment: "unknown equipment", location: "unknown location", station: "unknown station", reason: "unknown reason", eta: "unknown return-to-service date"}
    
#     #allows us to keep the defaults from the default parameters, unless there is an incoming non-nil parameter
#     defaults.merge!(details)
#     @name = name
#     @equipment = defaults[:equipment]
#     @location = defaults[:location]
#     @station = defaults[:station]
#     @reason = defaults[:reason]
#     @eta = defaults[:eta]
#   end 

# end



# class Subway::Issue 
#   attr_accessor :name, :location, :problem, :exactlocation, :fixedestimate
  
#   def self.current 
#     # I should return a bunch of instances of Issue 
#     #   puts "1. Elevator Issues"
#     #   puts "2. Escalator Issues"
#     # end 



# issue_1.name = "Elevator Issue"

#   issue_1.location = "Anacostia"
#   issue_1.problem = "Minor Repair"
#   issue_1.exactlocation = "under the stairway before the street"
#   issue_1.fixedestimate = "Noon on January 30, 2020"
  
#   issue_2 = self.new # same as... Issue.new 
#   issue_2.name = "Escalator Issue"
#   issue_2.location = "Congress Heights"
#   issue_2.problem = "Modernization"
#   issue_2.exactlocation = "Southside of the stairway before the street"
#   issue_2.fixedestimate = "Noon on December 30, 2019"
  
  # should return an array [issue_1, issue_2]
  # puts issue_1
  # puts issue_2
  #end
  
#   What is an issue
# -- Problem (aka SymptomDescription)
# -- Subway Location (aka StationName) +
# -- Equipment (aka UnitType)
# -- Exact location (aka LocationDescription)
# -- When Fixed (aka EstimatedReturnToService)
  