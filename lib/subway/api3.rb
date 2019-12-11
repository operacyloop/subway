require 'net/http'
require 'httparty'

#######################################################################
###### THIS PART IS THE CLASS THAT CREATES ISSUE OBJECTS ##############
#######################################################################

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
  
  #class method... [counts the objects aka the issues]
  def self.count
    @@count
  end
  
  #instance method...[see? no "self"; if there was self, this would be a class method]
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

#######################################################################
############ THIS PART GETS THE INFO FROM THE WMATA API ###############
#######################################################################

uri = URI('https://api.wmata.com/Incidents.svc/json/ElevatorIncidents')

 # Request parameters if needed them by putting this into coad below 'StationCode' => '{string}, but don't want station paramters because we want ALL the outages of all the escalators and elevators

query = URI.encode_www_form({})
      
# The following code is from WMATA (DC Subway). I think this goes through thing character by character, lol. Whoa...

if uri.query && uri.query.length > 0
    uri.query += '&' + query
else
    uri.query = query
end

request = Net::HTTP::Get.new(uri.request_uri)
# Request headers
request['api_key'] = '365be576f6f24a35b7b226a751b3c476' # Yeah, I had to sign up to get this key. It ws worth it, so I didn't have to deal with data limitations from the demo key 
# Request body

request.body = "{body}"

response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme ==  'https') do |http|
    http.request(request)
end

#lets see what data is in here for now...
outages = response.body
x = outages.split("},").to_a
# puts x.class # not needed any more, this was for testing purposes

#######################################################################
############ THIS PART GETS THE INFO FROM THE WMATA API ###############
#######################################################################


count = 0

while count <= (x.length)-1
    issue = x[count].delete! '{}:'
    issue = issue.split(",")
    count += 1
    
    # Yes, Issue is an array (next line, but commented), but end user doesn't care about this
    # puts "Issue is an #{issue.class}."
    
    equipment = "#{issue[1][10..100].delete('"').capitalize}"
    puts equipment
    
    station = "#{issue[4][13..100].delete('"')}"
    puts station
    
    location = "#{issue[5].delete('"')[19..100]}"
    puts location 
    
    reason = "#{issue[8][20..100]}"
    puts reason 
    
    eta = "#{issue[10][15..25].delete('"')}" 
    puts eta
    
    @collection_of_issues = [ ] #maybe should have @@ not sure
    #issue = Issue.new #(equipment, station, location, reason, eta)
    @collection_of_issues << issue  #maybe should have @@ not sure
    #p issue
    #p issue.class
   
   # puts @@collection_of_issues
   # puts @@collection_of_issues.class
   # puts @@collection_of_issues.length
    puts
  end


#DEFINE AN EXAMPLE HASH THAT CAN BE SENT TO CREATE AN OBJECT
#info = {equipment: "Escalator", location: "south lawn of the White House", station: "Congress Heights Station", reason: "Minor Repair", eta: "2019-12-10"} 
#a = Issue.new("Outage", info) 
#p a
#b = Issue.new
#c = Issue.new

#puts "The system currently has this many publicized issues:"
#puts Subway::Issue.count
#puts a.system

# Would you like outages related to:
# 1. Major issues
# 2. Minor issues
# 3. Service
# 4. Upgrades
# Which outage would you like more info block_given?
# Ex: "Elevator at Congress Heights"
# Would you like "list of ____ issues or back to the main list"
