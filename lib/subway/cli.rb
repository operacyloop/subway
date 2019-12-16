class CLI
  
###################################################################
##########  THIS PART THAT DEALS WITH INPUT FROM A HUMAN  #########
###################################################################
  
  def self.menu 
    input = nil
    while input != "exit"
      puts
      puts "Welcome to your go-to location for DC Subway Elevator and Escalator outages."
      puts "1 - Elevators"       
      puts "2 - Escalators"
      puts "Which would you like to get more information about? Type 'exit' to leave the program. Type list to see this again."
      puts
      input = gets.strip.downcase
    
###################################################################
########## THIS PART THAT DEALS WITH LOGIC IN THE PROGRAM #########
###################################################################
    
      if input == "1" 
        puts
        puts "Elevator Issues"
        puts "1."
        puts "2."
        puts "3."
      elsif input == "2"
        puts
        puts "Escalator Issues"
        puts "1."
        puts "2."
      elsif input == "list"
        list_of_issues 
      elsif input == "exit"
        goodbye
      else
        input_makes_no_sense
      end
    end
  end 
  
###################################################################
######### IF THEY INPUT SOMETHING THAT IS NOT AN OPTION... ########
###################################################################
  
  def self.input_makes_no_sense
    puts
    puts "I am not sure what you want. Want to try again?"
    puts "Enter 'Y' for yes and 'N' for no..."
    input = gets.strip.downcase
    if input == "y"
      puts
      puts "OK, let's give this another try..."
      puts
      list_of_issues
    else input == "n"
      goodbye
        # input_makes_no_sense
    end
  end 
     
# #   #   ##if input != "1" or "2"
# #   # ##   puts "Please choose 1 or 2"
# #   #   # if input.to_i > 0 
# #   #   #   the_issue = @issues[input.to_i-1] #subtract 1 so can find itin the array
# #   #   #   puts "#{issue.name}" #all the attributes here
# #   #   # elsif input == "list"
# #   #   #   list_of_issues
# #   #   # else 
# #   #   #   puts "not what you want"
# #   #   #case input 
# #   #   #when "1"
# #   #   #  puts "More info on Elevator Issues..."
# #   #   #when "2"
# #   #   #  puts "More info on Escalator Issues..."
# #   # # when "list"
# #   #   # list_issues
# #   #   end 
# end 
# end 
  
###################################################################
################### WHEN THEY DECIDE TO GO... #####################
###################################################################
  
  def self.goodbye 
    puts "Goodbye! Come back later for update escaltor and elevator outages!"
  end 

  def self.list_of_issues
    #@issues = issue.current 
    #@issues.each.with_index(1) do | issue, i | #starts indexing at 1 
     # puts "#{i}. #{issue}"
      puts
      puts "Current Metrorail Issues:"
    #  puts # issue_1
    #  puts # issue_2
    #end 
  end 

#   # # what follows is a class method and self is refering the class itself (aka the CLI class)...
    
###################################################################
###################### STARTS THE WHOLE THING #####################
###################################################################   
    
  def self.call
    puts "in the middle of the call method, a class method"
    list_of_issues
    menu
    goodbye
  end

end

CLI.menu