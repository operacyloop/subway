require 'net/http'
require 'httparty'
require 'time'

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
    #equipment = []
    @equipment =""
    
    # Yes, Issue is an array (next line, but commented), but end user doesn't care about this
    # puts "Issue is an #{issue.class}.
    equipment = 0 #"#{issue[1][10..100].delete('"').capitalize}" #EQUIPMENT works flawlessly
    station = 3 #"#{issue[4][13..100].delete('"')}" # STATION works flawlessly
    location = "#{issue[5]}" #Got rid of [20..100] for testing purposes
    reason = 9 # "#{issue[8][20..100]}"
    eta = "#{issue[12][27..36].to_s}"
  
    info = {equipment: equipment, station: station, location: location, reason: reason, eta: eta}
    puts info[:location]
    puts
  end
