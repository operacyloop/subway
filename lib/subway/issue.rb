class Issue 
  attr_accessor :name, :location, :problem, :exactlocation, :fixedestimate
  
  def self.current 
     # I should return a bunch of instances of Issue 
     #   puts "1. Elevator Issues"
     #   puts "2. Escalator Issues"
     # end 
  issue_1 = self.new # same as... Issue.new 
  issue_1.name = "Elevator Issue"
  issue_1.location = "Anacostia"
  issue_1.problem = "Minor Repair"
  issue_1.exactlocation = "under the stairway before the street"
  issue_1.fixedestimate = "Noon on January 30, 2020"
  
  issue_2 = self.new # same as... Issue.new 
  issue_2.name = "Escalator Issue"
  issue_2.location = "Congress Heights"
  issue_2.problem = "Modernization"
  issue_2.exactlocation = "Southside of the stairway before the street"
  issue_2.fixedestimate = "Noon on December 30, 2019"
  
  # should return an array [issue_1, issue_2]
  # puts issue_1
  # puts issue_2
  end
  
#   What is an issue
# -- Problem (aka SymptomDescription)
# -- Subway Location (aka StationName) +
# -- Equipment (aka UnitType)
# -- Exact location (aka LocationDescription)
# -- When Fixed (aka EstimatedReturnToService)
  