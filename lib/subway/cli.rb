class CLI
  
  def self.call
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
        call
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
    puts "I am not sure what you want."
    puts
    puts "Want to try again? Enter 'Y' for yes and 'N' [or any other input] for no..."
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
  
end

CLI.call

