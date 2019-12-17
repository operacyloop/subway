class CLI
  
  def self.menu 
    input = nil
    while input != "exit"
      puts
      puts "Welcome to your go-to location for DC Subway Elevator and Escalator outages."
      puts "1 - Elevators"       
      puts "2 - Escalators"
      puts "Which would you like to get more information about? Type 'exit' to leave the program. Type 'list' to see this again."
      puts
      input = gets.strip.downcase
    
      if input == "1" 
        elevator
      elsif input == "2"
        escaltor
      elsif input == "menu"
        menu
      elsif input == "exit"
        goodbye
      else
        input_makes_no_sense
      end
    end
  end 
  
  def self.elevator 
    puts
    puts "This is where the ELevator issues go"
    puts
  end
  
  def self.escaltor
    puts
    puts "This is where the EScalator issues go"
    puts
  end
  
  def self.input_makes_no_sense
    puts
    puts "I am not sure what you want. Want to try again?"
    puts
    puts "Enter 'Y' for yes and 'N' [or any other input] for no..."
    input = nil
    input = gets.strip.downcase
    if input == "y"
      puts "OK, let's give this another try..."
      menu
    else 
      puts "OK, later gator!"
      goodbye 
    end
  end
  
  def self.goodbye 
    puts "Goodbye! Come back later for update escaltor and elevator outages!"
  end 

  # def self.list_of_issues
  #   #@issues = issue.current 
  #   #@issues.each.with_index(1) do | issue, i | #starts indexing at 1 
  #   # puts "#{i}. #{issue}"
  #     puts
  #     puts "Current Metrorail Issues:"
  #   #  puts # issue_1
  #   #  puts # issue_2
  #   #end 
  # end 

#   # # what follows is a class method and self is refering the class itself (aka the CLI class)...
    
###################################################################
###################### STARTS THE WHOLE THING #####################
###################################################################   
    
  def self.call
    puts "in the middle of the call method, a class method"
    menu
    goodbye
  end
  
end

CLI.menu