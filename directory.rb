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
    # get age
    print "Age:\t\t"
    age = gets
      # tests if the user inputs numbers or not. If it is a string, the user is prompted to input a number for age.
      until !age.empty? do
        puts "Please enter a valid NUMBER as age."
        print "Age:\t\t"
        age = gets # converts input to an integer for easier later use
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
    students << {first_name: first_name, last_name: last_name, nationality: nationality, age: age, cohort: cohort} unless first_name.empty?
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
  puts "\n"
  puts "STUDENT LOOK-UP".center(75, "-")
  puts "To look up students by first name, simply type the letter you are looking for.".center(75)
  puts "To see all students, just type \"ALL\"".center(75)
  print "Look up:\t"
  letter = gets.upcase.chomp
    if letter == "ALL"
    students.each_with_index do |student, index|
      puts "\n"
      puts "#{index + 1}. #{student[:first_name]} (#{student[:cohort]} cohort)" if student[:first_name].length < 12
    end
  else
    i = 0
    until i == students.count
      puts "\n"
      puts "#{i + 1}. #{students[i][:first_name]} (#{students[i][:cohort]} cohort)" if students[i][:first_name].start_with?(letter) && students[i][:first_name].length < 12
      i += 1
    end
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
