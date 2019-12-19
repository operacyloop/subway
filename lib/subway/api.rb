require 'net/http'
require 'httparty'

class API
  
  @@all = []
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
  request['api_key'] = '365be576f6f24a35b7b226a751b3c476' 
  request.body = "{body}"
  response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme ==  'https') do |http|
  http.request(request)
  end

  outages = response.body
  outages = outages[23..outages.size-1].gsub!(":", ": ").gsub!(",", ", ")
  x = outages.split("},").to_a  # was x = outages.split("},").to_a
  count = 0
  while count <= x.length-2
    issue = x[count] #.delete! '{}:'
    issue = issue.split(",")
    count += 1
    equipment = "#{issue[1][13..23].delete('"').capitalize}" #PERFECT
    station = "#{issue[4][16..40].delete('"')}" #PERFECT
    location = "#{issue[5][25..70]}"
    reason = "#{issue[8]}" #[20..100] #it's getting fed the wrong data, that's why it can't parse it correctly; SKIP FOR NOW
    eta = "#{issue[-1][30..39]}"  #PERFECT
    info = {equipment: equipment, station: station, location: location, reason: reason, eta: eta}
    @@all << Issue.new(count, info)
    puts
   end
end 


