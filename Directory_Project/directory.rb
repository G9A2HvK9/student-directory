# Menu Methods
def menu_main # defines the whole main menu, based oin sub formulas
  menu_header
  puts "\n"
  menu_print
  puts "\n"
  menu_prompt
  puts"\n"
  menu_selection(@menu_selection)
end
def menu_header # Header for the general student directory
  puts "-".center(100,"-")
  puts " HENDRIK'S ACADEMY STUDENT DIRECTORY ".center(100,"-")
  puts "          Please make a selection          ".center(100,"-")
  puts "-".center(100,"-")
end
def menu_print # Prints the Menu to the console
  puts "1. Register new Student"
  puts "2. Display list of students"
  puts "3. Save all students to CSV file"
  puts "9. Exit"
end
def menu_prompt # Prompts for user input and stores it in the global variable menu_selection
  print "Please type a number to select input: "
  @menu_selection = gets.chomp
end
def menu_selection(menu_selection) # Takes next step after menu_selection (including rescue)
  case menu_selection
    when "1"
      registration_main
    when "2"
      display
    when "3"
      save_to_file
    when "9"
      exit
    else
      puts "Please enter valid intput 1 through 9"
  end
end

# Registration methods
@all_students = []
def registration_main # Defines the whole registration process, based on sib methods as listed below.
  registration_header
  puts "\n"
  registration_prompt
  puts "\n"
  registration_first_name
  registration_last_name
  @valid_nationalities
  registration_nationality
  @valid_cohorts
  registration_cohort
  registration_commit_to_array
  puts"\n"
  registration_check_header
  puts "\n"
  registration_check_details
  puts"\n"
  registration_check_prompt
  puts"\n"
  registration_check_action
  puts "\n"
  registration_next_menu
  registration_next_selection
  puts"\n"
  exit
end
def registration_header # Header for the student registration process
  puts "-".center(100,"-")
  puts " REGISTERING NEW STUDENT ".center(100,"-")
  puts "-".center(100,"-")
end
def registration_prompt # Prompts for user input for student registration and gives explanation for use
  puts "You are registering a new student. Please follow all instructions.".center(100)
  puts "To abort at any time, simply type \"Exit\" into any field to return to the main menu.".center(100)
end
def registration_first_name # Method to register the first name, including Exit rescue and empty input rescue
  print "First Name:\t"
  @first_name = gets.chomp.capitalize.to_s
  loop do
    case
      when @first_name == "Exit"
        registration_rescue_exit
      when @first_name.empty?
        registration_rescue_error
        puts "Field empty. Please enter valid First Name".center(100)
        puts "\n"
        print "First Name:\t"
        @first_name = gets.chomp.to_s
      else
        return @first_name
    end
  end
end
def registration_last_name # Method to register the last name, including Exit rescue and empty input rescue
  print "Last Name:\t"
  @last_name = gets.chomp.capitalize.to_s
  loop do
    case
      when @last_name == "Exit"
        registration_rescue_exit
      when @last_name.empty?
        registration_rescue_error
        puts "Field empty. Please enter valid Last Name".center(100)
        puts "\n"
        print "Last Name:\t"
        @last_name = gets.chomp.to_s
      else
        return @last_name
    end
  end
end
def registration_nationality # Method to register the nationality, including Exit rescue and empty input rescue
  @valid_nationalities
  print "Nationality:\t"
  @nationality = gets.chomp.capitalize.to_s
  loop do
    case
      when @nationality == "Exit"
        registration_rescue_exit
      when @nationality.empty?
        registration_rescue_error
        puts "Field empty. Please enter valid Nationality".center(100)
        puts "\n"
        print "Nationality:\t"
        @nationality = gets.chomp.capitalize.to_s
      when !@valid_nationalities.include?(@nationality)
        registration_rescue_error
        puts "Sorry. Although we currently have #{@valid_nationalities.count} nationalities on file, #{@nationality} is not one of them.".center(100)
        puts "Please enter a valid nationality or try a different spelling.".center(100)
        puts "\n"
        print "Nationality:\t"
        @nationality = gets.chomp.capitalize.to_s
      else
        return @nationatlity
    end
  end
end
def registration_cohort # Method to register the last name, including Exit rescue and empty input rescue
  print "Cohort:\t\t"
  @cohort = gets.chomp.capitalize.to_s
  loop do
    case
      when @cohort == "Exit"
        registration_rescue_exit
      when @cohort.empty?
        registration_rescue_error
        puts "Field empty. Please enter valid Cohort".center(100)
        puts "\n"
        print "Cohort:\t\t"
        @cohort = gets.chomp.capitalize.to_s
      when !@valid_cohorts.include?(@cohort)
        registration_rescue_error
        puts "This is not a valid cohort. Please enter valid Cohort".center(100)
        puts "\n"
        print "Cohort:\t\t"
        @cohort = gets.chomp.capitalize.to_s
      else
        return @cohort
    end
  end
end
def registration_commit_to_array
  @all_students.push(first_name: @first_name, last_name: @last_name, nationality: @nationality, cohort: @cohort)
end
def registration_check_header
  puts "NEW STUDENT ADDED".center(100,"-")
  puts "You successfully registered a new student to the directory.".center(100)
  puts "Please check details to determine if the input was correct.".center(100)
end
def registration_check_details
  puts "#{@all_students.last[:cohort]} cohort".center(100)
  puts "#{@all_students.last[:first_name]} #{@all_students.last[:last_name]}, #{@all_students.last[:nationality]}".center(100)
end
def registration_check_prompt
    puts "Please confirm details for #{@all_students.last[:first_name]} #{@all_students.last[:last_name]}".center(100)
    print "\nAre the details correct? (YES/NO): "
    @valid = gets.chomp.upcase.to_s
    return @valid
end
def registration_check_action
  loop do
    case
      when @valid == "YES"
        registration_footer
      break
      when @valid == "NO"
        puts "Deleting entry for #{@all_students.last[:first_name]} #{@all_students.last[:last_name]}".center(100)
        @all_students.pop
        puts "Please enter correct details below.\n".center(100)
        registration_main
      break
      else
        puts "This is not valid input. Please type either \"YES\" or \"NO\""
        print "YES/NO:\t"
        @valid = gets.upcase.to_s.chomp
      end
    end
end
def registration_footer
  case
    when @all_students.count == 1
      puts "Currently there is #{@all_students.count} student registered with Hendrik's Academy".center(100,"-")
      puts "          What would you like to do next?          ".center(100,"-")
    when @all_students.count > 1
      puts "Currently there are #{@all_students.count} students registered with Hendrik's Academy".center(100,"-")
      puts "          What would you like to do next?          ".center(100,"-")
    when @all_students.count == 0
      puts "Currently there are no students registered with Hendrik's Academy".center(100,"-")
      puts "          What would you like to do next?          ".center(100,"-")
    else
      puts "We are experiencing difficulties determining the number of students at Hendrik's Academy".center(100,"-")
      puts "          Please type \"Exit\" to return to main menu          ".center(100,"-")
    end
  end
def registration_next_menu
  puts "1. Add Another Student\n2. Display Students\n3. Go to Main Menu"
  print "\nPlease type a number to select input: "
  @registration_selection = gets.chomp
end
def registration_next_selection # Takes next step after menu_selection (including rescue)
  loop do
    case @registration_selection
      when "1"
        registration_main
        break
      when "2"
        display
        break
      when "3"
        menu_main
        break
      else
        puts "Please enter valid intput 1, 2 or 3"
        print "Input: "
        @registration_selection = gets.chomp
      end
    end
end

# Display methods
@all_students
def display
  puts "All students"
  @all_students.each do |student|
    puts "#{student[:first_name]} #{student[:last_name]}, #{student[:nationality]}"
  end
end

# save to file methods
def save_to_file
  file = File.open("students.csv", "w")
  @all_students.each do |student|
    student_data = [student[:first_name], student[:last_name], student[:nationality], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end




# Registration Rescues
def registration_rescue_exit
  puts "\n"
  puts "You are returning to the main menu".center(100)
  puts "\n"
  menu_main
end # when input = "Exit" this method is called to return to main menu
def registration_rescue_error # posts the initial error message for registration errors.
  puts "\n"
  puts "REGISTRATION ERROR".center(100,"*")
end
# Registration arrays
  @valid_cohorts = ["January", "February", "March", "April","May", "June", "July", "August", "September", "October", "November", "December"]
  @valid_nationalities = ["Afghan", "Albanian", "Algerian", "American", "Andorran", "Angolan", "Antiguans", "Argentinean", "Armenian",
  "Australian", "Austrian", "Azerbaijani", "Azeri", "Bahamian", "Bahraini", "Bangladeshi", "Barbadian", "Barbudans", "Batswana",
  "Belarusian", "Belgian", "Belizean", "Beninese", "Bhutanese", "Bolivian", "Bosnian", "Brazilian", "British", "Bruneian", "Bulgarian",
  "Burkinabe", "Burmese", "Burundian", "Cambodian", "Cameroonian", "Canadian", "Cape Verdean", "Central African", "Chadian", "Chilean",
  "Chinese", "Colombian", "Comoran", "Congolese", "Costa Rican", "Croatian", "Cuban", "Cypriot", "Czech", "Danish", "Djibouti",
  "Dominican", "Dominican", "Dutch", "Dutchman", "Dutchwoman", "East Timorese", "Ecuadorean", "Egyptian", "Emirian", "Equatorial Guinean",
  "Eritrean", "Estonian", "Ethiopian", "Fijian", "Filipino", "Finnish", "French", "Gabonese", "Gambian", "Georgian", "German", "Ghanaian",
  "Greek", "Grenadian", "Guatemalan", "Guinea-Bissauan", "Guinean", "Guyanese", "Haitian", "Herzegovinian", "Honduran", "Hungarian",
  "I-Kiribati", "Icelander", "Icelandic", "Indian", "Indonesian", "Iranian", "Iraqi", "Irish", "Israeli", "Italian", "Ivorian", "Jamaican",
  "Japanese", "Jordanian", "Kazakhstani", "Kenyan", "Kittian and Nevisian", "Kuwaiti", "Kyrgyz", "Laotian", "Latvian", "Lebanese", "Liberian",
  "Libyan", "Liechtensteiner", "Lithuanian", "Luxembourger", "Luxembourgish", "Macedonian", "Malagasy", "Malawian", "Malaysian", "Malay",
  "Maldivan", "Malian", "Maltese", "Marshallese", "Mauritanian", "Mauritian", "Mexican", "Micronesian", "Moldovan", "Monacan", "Mongolian",
  "Moroccan", "Mosotho", "Motswana", "Mozambican", "Namibian", "Nauruan", "Nepalese", "Netherlander", "New Zealander","Ni-Vanuatu", "Nicaraguan",
  "Nigerian", "Nigerien", "North Korean", "Northern Irish", "Norwegian", "Omani", "Pakistani", "Palauan", "Panamanian", "Papua New Guinean",
  "Paraguayan", "Peruvian", "Polish", "Portuguese", "Qatari", "Romanian", "Russian", "Rwandan", "Saint Lucian", "Salvadoran", "Samoan",
  "San Marinese", "Sao Tomean", "Saudi", "Scottish", "Senegalese", "Serbian", "Seychellois", "Sierra Leonean", "Singaporean", "Slovakian",
  "Slovenian", "Solomon Islander", "Somali", "South African", "South Korean", "Spanish", "Sri Lankan", "Sudanese", "Surinamer", "Swazi",
  "Swedish", "Swiss", "Syrian", "Taiwanese", "Tajik", "Tanzanian", "Thai", "Togolese", "Tongan", "Trinidadian", "Tobagonian", "Tunisian",
  "Turkish", "Tuvaluan", "Ugandan", "Ukrainian", "Uruguayan", "Uzbekistani", "Uzbek", "Venezuelan", "Vietnamese", "Welsh", "Yemenite", "Zambian", "Zimbabwean"]

# Runs the Menu
menu_main
