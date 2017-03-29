# Let's put all the students in an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Jeoffrey Baratheon",
  "Norman Bates"
]

def print_header
  puts "The students of Hendrik's Academy"
  puts "--------------------"
end

def print_names(students)
  students.each do |name|
    puts name
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
# Nothing happens until we call the methods
print_header
print_names(students)
print_footer(students)
