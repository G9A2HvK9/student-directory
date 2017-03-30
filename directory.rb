# Getting input from user regarding student information.
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  print "First Name: "
  first_name = gets.capitalize.chomp
  # while the first_name is not empty, repeat this code
  while !first_name.empty? do
    #prompts for more info on student from user
    puts "Let's get some more info on #{first_name}!"
    # get last name
    print "Last name: "
    last_name = gets.capitalize.chomp #capitalizes the first letter of the string for standardization in later use
      # If last_name is left blank this sequence runs to request valid input.
      if last_name.empty?
        puts "Please enter a valid last name."
        print "Last Name: "
        last_name = gets.capitalize.chomp # capitalizes the first letter of the string for standardization in later use
      end
    # get nationality
    print "Nationality: "
    nationality = gets.capitalize.chomp
      # If nationality is left blank this sequence runs to request valid input.
      if nationality.empty?
        puts "Please enter a valid Nationality."
        print "Nationality: "
        nationality = gets.capitalize.chomp # capitalizes the first letter of the string for standardization in later use
      end
    # get age
    print "Age: "
    age = gets
      # tests if the user inputs numbers or not. If it is a string, the user is prompted to input a number for age.
      if age.is_a? String
        puts "Please enter a valid NUMBER as age."
        print "Age: "
        age = gets.to_i # converts input to an integer for easier later use
      elsif !age.is_a? String
        age = age.to_i # converts input to integer for easier later use
      end
    # get cohort
    print "Cohort: "
    cohort = gets.capitalize.chomp
      # if the cohort is not a valid month of the year, the user is asked to provide correct input. There must be a more elegant solution using arrays.
      if cohort != ("January" || "February" || "March" || "April" || "May" || "June" || "July" || "August" || "September" || "October" || "November" || "December")
        puts "Please enter a VALID MONTH as #{first_name}\'s cohort"
        print "Cohort: "
        cohort = gets.capitalize.chomp # capitalizes the first letter of the string for standardization in later use
      end
    # add student hash to the array
    students << {first_name: first_name, last_name: last_name, nationality: nationality, age: age, cohort: cohort} unless first_name.empty?
    puts "Now we have #{students.count} students"
    # get another name from user
    puts "To add another student, please type their first name here. To quit, hit enter."
    print "First Name: "
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
  puts "Would you like to look for students beginning with a specific letter?"
  puts "To see all students, just type \"ALL\""
  letter = gets.upcase.chomp
    if letter == "ALL"
    students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:first_name]} (#{student[:cohort]} cohort)" if student[:first_name].length < 12
    end
  else
    i = 0
    until i == students.count
      puts "#{i + 1}. #{students[i][:first_name]} (#{students[i][:cohort]} cohort)" if students[i][:first_name].start_with?(letter) && students[i][:first_name].length < 12
      i += 1
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
# Nothing happens until we call the methods
students = input_students
print_header
print_names(students)
print_footer(students)
