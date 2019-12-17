require 'net/http'
require 'httparty'

class API
  
#@@all = [] 

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

count = 0

while count <= x.length-2
     issue = x[count].delete! '{}:'
     issue = issue.split(",")
     count += 1
     puts "Issue is an #{issue.class}."
     equipment = "Equipment: #{issue[1][10..100].delete('"').capitalize}"
     puts equipment
    
     station = "Station Name: #{issue[4][13..100].delete('"')}"
     puts station
    
     location = "Location: #{issue[5].delete('"')[19..100]}"
     puts location 
    
     reason = "Reason for outage: #{issue[8][20..100].delete('"')}"
     puts reason 
    
     eta = "Anticipated repair date: #{issue[10][15..25].delete('"')}" 
     puts eta
     puts eta.class
     
     @@all << Issue.new(count, {:equipment, :station, :location, :reason, :eta})
    

     # @@collection_of_issues = [ ]
     # issue = Issue.new(3, {})
     # @@collection_of_issues << issue
    # puts "issue inspected is..."
    # p issue
    # puts "issue class is..."
    # p issue.class
   
     # puts @@collection_of_issues
     # puts @@collection_of_issues.class
     # puts @@collection_of_issues.length
     puts
   end
   puts "@@all = #{@@all}"
end 


# class Issue 
#   attr_accessor :equipment, :station, :location, :reason, :eta
#     def initialize 
#       @equipment_a = @equipment
#       @station_a = @station 
#       @location_a = @location 
#       @reason_a = @reason 
#       @eta_a = @eta 
#     end 
#   end 