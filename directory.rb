def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add student hash to the array
    students << {name: name, cohort: :november} unless name.empty?
    puts "Now we have #{students.count} students"
    # get another name from user
    name = gets.chomp
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
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name].length < 12
    end
  else
    i = 0
    until i == students.count
      puts "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]} cohort)" if students[i][:name].start_with?(letter) && students[i][:name].length < 12
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
