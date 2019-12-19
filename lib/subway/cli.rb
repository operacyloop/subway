class CLI
  
  def call
    
    input = nil
      puts
      puts "Welcome to your go-to location for DC Subway Elevator and Escalator outages."
      puts "Which would you like to get more information about?"
      puts "1 - Elevator issues."       
      puts "2 - Escalator issues."
      puts "3 - or 'tally'- to get a tally of all all escalator and elevator issues."
      puts "4 - or 'details' - to see a list of issues by station, and see more details if you wish."
      puts "5 - or 'both' - to see a list of stations that have both elevator and escalator issues."
      puts "6 - or 'menu' - to see this complete list again."
      puts "7 - or 'exit' - to leave the program. Type 'list' to see this again."
      input = gets.strip.downcase
      case input 
      when "1", "elevator", "elevators"
        elevator
      when "2", "escalator", "escaltors"
        escalator 
      when "menu", "list", "6"
        call 
      when "exit", "bye", "7"
        goodbye 
      when "tally", "3"
         tally
      when "both", "5"
         both
      when "eta", "4", 'details'
        eta
      else 
        input_makes_no_sense
      end 
  end 
  
 def eta 
   puts
   puts "Details and estimated repair dates..."
   count = 0
   
   Issue.all.each.with_index(1) do | ish, i |
     puts " #{i} - #{ish.station} [#{ish.equipment}]"
   end
   
   input = gets.strip.downcase.to_i
   awesome = Issue.all[input-1]
     puts 
     puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
     puts "Details on this #{awesome.station} #{awesome.equipment} outage:"
     puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
     puts "This is an #{awesome.equipment.downcase} problem at the #{awesome.station} Metrorail Station."
     puts "The reason for this outage is that it is a #{awesome.reason},"
     puts "and the estimated repair date is #{awesome.eta}."
     puts "This #{awesome.equipment.downcase} outage can be found at the" 
     puts "station #{awesome.location.downcase[21..100]}."
     puts
     puts "Press any key to continue..."
     press = gets
  call
 end 
  
 def both
   puts
   count = 0
   count2 = 0
   array_of_elevator_issues = []
   array_of_uppyuppy_issues = []
    
   #ELEVATOR ISSUES... 
   while count < 1000
     if Issue.all[count] != nil
       if Issue.all[count].equipment == "Elevator"
         array_of_elevator_issues << Issue.all[count].station
         array_of_elevator_issues.uniq!
       end
     end
     count += 1
   end
    
    #ESCALATOR ISSUES...
    while count2 < 1000
      if Issue.all[count2] != nil
        if Issue.all[count2].equipment == "Escalator"
          array_of_uppyuppy_issues << Issue.all[count2].station
          array_of_uppyuppy_issues.uniq!
        end
      end
      count2 += 1
    end
   puts "Info on Stations with elevator and escalator issues:"
   puts "* #{array_of_elevator_issues.length} stations have elevator issues."
   puts "* #{array_of_uppyuppy_issues.length} stations have escalator issues."
   both_issues =  array_of_elevator_issues & array_of_uppyuppy_issues
   puts "* #{both_issues.length} have both elevator and escalator issues. These are those stations:"
   puts both_issues
   puts 
   puts "Press any key to continue..."
   press = gets
   call
 end 
 
 def tally
   puts "tally number of elevator and escalator issues:"
   count = 0
   print_again = true
    while count < 1000
      if Issue.all[count] != nil
        print "counting now... "
      else 
        if print_again == true 
          puts "COUNT = #{count}"
        end
        print_again = false
      end
      count += 1
   end
   puts
   puts "Press any key to continue..."
   press = gets
   call
 end
   
 def elevator 
    puts
    puts "Stations where there are ELEVATOR issues:"
    count = 0
    array_of_elevator_issues = []
    while count < 1000
      if Issue.all[count] != nil
        if Issue.all[count].equipment == "Elevator"
          array_of_elevator_issues << Issue.all[count].station
          array_of_elevator_issues.uniq!
        end
        #puts "count = #{count}"
      end
      count += 1
    end
    puts array_of_elevator_issues.sort
    puts
    puts "Press any key to continue..."
    press = gets
    call
  end
  
  def escalator
    puts
    puts "Stations where there are ESCALATOR issues:"
    count = 0
    array_of_escalator_issues = []
    while count < 1000
      if Issue.all[count] != nil
        if Issue.all[count].equipment == "Escalator"
          array_of_escalator_issues << Issue.all[count].station
          array_of_escalator_issues.uniq!
        end
      end
      count += 1
    end
    puts array_of_escalator_issues.sort
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
    puts
    puts "Goodbye! Come back later for update escalator and elevator outages!"
    puts
  end 
end