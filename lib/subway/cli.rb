class CLI
  
def self.menu 
  input = nil
  while input != "exit"
    puts "Welcome to your go-to location for DC Subway Elevator and Escalator outages."
    puts "1 - Elevators"
    puts "2 - Escalators"
    puts "Which would you like to get more information about? or 'exit' to leave the program."
    
    input = gets.strip.downcase
    
    #######################################################################
    ######### THIS PART THAT DEALS WITH LOGIC IN THE PROGRAM ##############
    #######################################################################
    
    if input == "1" 
      puts "Elevator Issues"
    if input == "2"
      puts "Escalator Issues"
    elsif input == "list"
      list_of_issues 
    else
      puts "not what you want"
    end 
    
    
    ##if input != "1" or "2"
   ##   puts "Please choose 1 or 2"
    
      
      
    # if input.to_i > 0 
    #   the_issue = @issues[input.to_i-1] #subtract 1 so can find itin the array
    #   puts "#{issue.name}" #all the attributes here
    # elsif input == "list"
    #   list_of_issues
    # else 
    #   puts "not what you want"
    #case input 
    #when "1"
    #  puts "More info on Elevator Issues..."
    #when "2"
    #  puts "More info on Escalator Issues..."
   # when "list"
     # list_issues
    end 
  end 
end 
  
  def self.goodbye 
   puts "goodbye! Come back later for update escaltor and elevator outages"
  end 

    def self.list_of_issues
     # @issues = issue.current 
     # @issues.each.with_index(1) do | issue, i | #starts indexing at 1 
     #  puts "#{i}. #{issue}""
      puts "Current Metrorail Issues:"
      puts # issue_1
      puts # issue_2
      
    end 
    
  # # what follows is a class method and self is refering the class itself (aka the CLI class)...
    
  def self.call
    puts "in the middle of the call method, a class method"
    end 
    list_of_issues
    menu
    goodbye
  end
