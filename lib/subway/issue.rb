class Issue
  
  attr_accessor :name, :equipment, :location, :station, :reason, :eta 
  
  @@all = []
  
  def initialize(name, details={}) 
  
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
  end 
  
  def self.all
    @@all
  end
  
end
