class CLI
  
def self.menu 
  puts "in the middle of the menu"
  input = nil
  while input != "exit"
    puts "Enter the number of the Issue you'd like more information on or type list to see the issues again or exit:"
    input = gets.strip.downcase
    
   # #The following is the logic dealing with how to deal with the user input
   # # Also, a string evaluates to zero until it's a string number "8" = 8
   # # logic needs to be fixed
   
    if input.to_i > 0 
      the_issue = @issues[input.to_i-1] #subtract 1 so can find itin the array
      puts "#{issue.name}" #all the attributes here
    elsif input == "list"
      list_of_issues
    else 
      puts "not what you want"
   # else 

  #   # case input 
  #   # when "1"
  #   #   puts "More info on Elevator Issues..."
  #   # when "2"
  #   #   puts "More info on Escalator Issues..."
  #   # when "list"
  #   #   list_issues
  
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
