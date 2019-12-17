class CLI
  
  def call
    input = nil
      puts
      puts "Welcome to your go-to location for DC Subway Elevator and Escalator outages."
      puts "1 - Elevators"       
      puts "2 - Escalators"
      puts "Which would you like to get more information about? Type 'exit' to leave the program. Type 'list' to see this again."
      puts
      input = gets.strip.downcase
      case input 
      when "1"
        elevator
      when "2"
        escaltor 
      when "menu", "list"
        call 
      when "exit"
        goodbye 
      else 
        input_makes_no_sense
      end 
  end 
  
  def elevator 
    puts
    puts "This is where the Elevator issues go..."
    puts
    call
  end
  
  def escaltor
    puts
    puts "This is where the Escalator issues go..."
    puts
    call
  end
  
  def input_makes_no_sense
    puts
    puts "I am not sure what you want."
    puts
    puts "Want to try again? Enter 'Y' for yes and 'N' [or any other input] for no..."
    input = nil
    input = gets.strip.downcase
    case input
    when "y", "Y", "yes", "yeah", "sure"
      "OK, let's give this another try..."
      call
    when "n", "N", "no", "nah", "nope"
      "OK, later gator!"
      goodbye 
    else
      goodbye
    end
  end
  
  def goodbye 
    puts "Goodbye! Come back later for update escalator and elevator outages!"
    puts
  end 
  
end


