# menu to prompt for options from user
def interactive_menu
  loop do
  #1. Print menu and ask user what to do
  puts "1. Register new students"
  puts "2. Display a list of students"
  puts "9. Exit"

  #2. Read the input and save it into a variable
  selection = gets.chomp

  #3. Do what the user has asked
  case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print_names(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "Please enter valid intput 1 through 9"
    end
  #4. Repeat from step 1
end

# Getting input from user regarding student information.
def input_students
  puts "\n"
  puts "NEW STUDENT REGISTRATION".center(75 ,"-")
  puts "Please enter the information of the student you would like to register.".center(75)
  puts "To abort, leave first name blank and hit return.".center(75)
  puts"\n"
  # create an empty array
  students = []
  # get the first name
  print "First Name:\t"
  first_name = gets.capitalize.chomp
  # while the first_name is not empty, repeat this code
  while !first_name.empty? do
    # get last name
    print "Last Name:\t"
    last_name = gets.capitalize.chomp #capitalizes the first letter of the string for standardization in later use
      # If last_name is left blank this sequence runs to request valid input.
      until !last_name.empty? do
        puts "Please enter a valid last name."
        print "Last Name:\t"
        last_name = gets.capitalize.chomp # capitalizes the first letter of the string for standardization in later use
      end
    # get nationality
    print "Nationality:\t"
    nationality = gets.capitalize.chomp
      # If nationality is left blank this sequence runs to request valid input.
      until !nationality.empty? do
        puts "Please enter a valid Nationality."
        print "Nationality:\t"
        nationality = gets.capitalize.chomp # capitalizes the first letter of the string for standardization in later use
      end
    # get cohort
    print "Cohort:\t\t"
    cohort = gets.capitalize.chomp
      # until the cohort is valid month of the year, the user is asked to provide correct input. There must be a more elegant solution using arrays.
      until cohort == "January" || cohort == "February" || cohort == "March" || cohort == "April" || cohort == "May" || cohort == "June" || cohort == "July" || cohort == "August" || cohort == "September" || cohort == "October" || cohort == "November" || cohort == "December"  do
        puts "Please enter a VALID MONTH as #{first_name}\'s cohort"
        print "Cohort: "
        cohort = gets.capitalize.chomp # capitalizes the first letter of the string for standardization in later use
      end
    # add student hash to the array
    students << {first_name: first_name, last_name: last_name, nationality: nationality, cohort: cohort} unless first_name.empty?
      # if statement to display the number of students currently registered. Depending on number, the message changes.
      puts "\n"
      if students.count < 1
        puts "We have no students currently attending Hendrik's Academy.".center(75,"-")
      elsif students.count == 1
        puts "We have registered #{students.count} student.".center(75,"-")
      elsif students.count > 1
        puts "We now have registered #{students.count} students.".center(75,"-")
      end
    # get another name from user
    puts "To register another student, please type their first name. To abort, hit enter.".center(75)
    puts "\n"
    print "First Name:\t"
    first_name = gets.capitalize.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Hendrik's Academy"
  puts "--------------------"
end

def print_names(students)
  cohorts = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December", "All"]
  puts "\n"
  puts "STUDENT LOOK-UP".center(75, "-")
  puts "To look up students in a particular cohort, please type the cohort you would like to display.".center(75)
  puts "To see all students, just type \"All\"".center(75)
  puts "\n"
  print "Look up:\t"
  cohort = gets.capitalize.chomp
    until cohorts.include?(cohort) do
      puts "This is not a valid input. Please enter the cohort you would like to display. To see all students, type \"All\""
      puts "\n"
      print "Look up:\t"
      cohort = gets.capitalize.chomp
    end
    if cohort == "All"
      i = 0
      puts "\n"
      students.map{|student| puts "#{i += 1}. #{student[:first_name]} #{student[:last_name]}\t#{student[:cohort]}"}
    elsif cohort != "All" && cohorts.include?(cohort)
      i = 0
      puts "\n"
      students.map{|student| puts "#{i += 1}. #{student[:first_name]} #{student[:last_name]}\t#{student[:cohort]}"} if students.map{|student| student[:cohort] = cohort}
    else
      puts "Sorry, there are currently no students registered in the #{cohort} cohort."
    end
end

def print_footer(students)
  puts "\n"
  puts "Overall, we have #{students.count} great students".center(75,"-")
end
# Nothing happens until we call the methods
students = input_students
print_header
print_names(students)
print_footer(students)
