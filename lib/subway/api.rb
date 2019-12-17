require 'net/http'
require 'httparty'

class API

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
     
     equipment = "#{problem[1][10..100].delete('"').capitalize}" #EQUIPMENT works flawlessly
     station = "#{problem[4][13..100].delete('"')}" # STATION works flawlessly
     location = "#{problem[5].delete_prefix('"LocationDescription""').delete_suffix('"').delete_prefix(" ")}" #LOCATION Works Flawlessly
     reason = "#{problem[8]}" #[20..100] #it's getting fed the wrong data, that's why it can't parse it correctly; SKIP FOR NOW
     eta = "#{problem[12][27..36].to_s}" #its getting fed the wrong thing, why?! SKIP FOR NOW
  
    #Takes the data and puts into a hash (now go make an object!)
    info = {equipment: equipment, station: station, location: location, reason: reason, eta: eta}
    # puts info[:equipment], info[:station], info[:location]
     
    # equipment = "Equipment: #{issue[1][10..100].delete('"').capitalize}"
    # puts equipment
    
    # station = "Station Name: #{issue[4][13..100].delete('"')}"
    # puts station
    
    # location = "Location: #{issue[5].delete('"')[19..100]}"
    # puts location 
    
    # reason = "Reason for outage: #{issue[8][20..100].delete('"')}"
    # puts reason 
    
     eta = "Anticipated repair date: #{issue[10][15..25].delete('"')}" 
     puts eta
     puts eta.class
     @@all << Issue.new(count, {:equipment, :station, :location, :reason, :eta})
     puts
   end
   puts "@@all = #{@@all}"
end 
