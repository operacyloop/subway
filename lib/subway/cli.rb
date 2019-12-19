
class CLI
  
  def call
    
    input = nil
      puts
      puts "Welcome to your go-to location for DC Subway Elevator and Escalator outages."
      puts "Which would you like to get more information about?"
      puts "1 - Elevators"       
      puts "2 - Escalators"
      puts "Type 'tally' to get a tally of all stations that have an equipment issue"
      puts "Type 'exit' to leave the program. Type 'list' to see this again."
      puts "Type 'both' to see a list of stations that have both elevator and escaltor issues."
      puts
      input = gets.strip.downcase
      case input 
      when "1", "elevator", "elevators"
        elevator
      when "2", "escalator", "escaltors"
        escalator 
      when "menu", "list"
        call 
      when "exit", "bye"
        goodbye 
      when "total"
        total
      when "tally"
         tally
      when "both"
         both
      else 
        input_makes_no_sense
      end 
  end 
  
 def both
   puts "Stations with both elevator and escalor issues:"
   puts "hardcoded list here"
   call
 end 
  
 def total
   puts "total number of stations with issues: XX"
   call
 end
 
  def tally
   puts "tally number of stations with issues: XX"
   call
 end
   
 def elevator 
    puts
    puts "Stations where there are ELEVATOR issues:"
    count = 0
    while count < 1000
      if Issue.all[count] != nil
        if Issue.all[count].equipment == "Elevator"
          puts "#{Issue.all[count].station}"
        end
      end
      count += 1
    end
    #input = gets.strip.downcase
    call
  end
  
  def escalator
     puts
    puts "Stations where there are ESCALATOR issues:"
    count = 0
    while count < 1000
      if Issue.all[count] != nil
        if Issue.all[count].equipment == "Escalator"
          puts "#{Issue.all[count].station}"
        end
      end
      count += 1
    end
    #input = gets.strip.downcase
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
      puts "OK, later gator!"
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