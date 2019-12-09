require 'net/http'
require 'httparty'

#class API
  
uri = URI('https://api.wmata.com/Incidents.svc/json/ElevatorIncidents')

 # Request parameters if needed them by putting this into coad below 'StationCode' => '{string}, but don't want station paramters because we want ALL the outages of all the escalators and elevators

query = URI.encode_www_form({})
      

# I think this goes through thing character by character, lol. Whoa...

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
puts x.class


count = 0

while count <= x.length
    issue = x[count].delete! '{}'
    issue = issue.split(",")
    count += 1
    puts issue.class
    puts issue[1].delete('"')
    puts issue[4].delete('"')
    puts issue[5]
    puts issue[8]
    puts issue[10]
    puts
  end


 # request['api_key'] = '365be576f6f24a35b7b226a751b3c476'
 # HTTParty.get('https://api.wmata.com/Incidents.svc/json/ElevatorIncidents')
  # puts response["ElevatorIncidents"]
  # puts outages
  
#end 
