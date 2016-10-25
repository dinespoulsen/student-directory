#first we print the list of students
def print_header
  puts   "The students of Villains Academy"
  puts "------------"
end

#def print(names)
#  names.each_with_index do |student, i|
#
#    puts "#{i + 1}: #{student[:name]} (#{student[:cohort]} cohort)" if student[:name].to_s.length < 12
#  end
#end

def print(names)
  exit if names.empty?
  i = 0
  while i < names.length
    output = "#{i + 1}: #{names[i][:name]}, age #{names[i][:age]} (#{names[i][:cohort]} cohort)"
    puts output.center(100)
    i += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []

  name = gets.chomp

  puts "Age, if I may ask?"
  age = gets.chomp.to_i

  puts "Which cohort"
  cohort = gets.chomp
  cohort.empty? ? cohort = "November" : cohort

  while !name.empty? do
    students << {name: name, cohort: cohort, age: age}
    if students.count > 1 || students.count == 0
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} student"
    end

    puts "Please enter the name of another student"
    puts "To finish, just hit return twice"
    name = gets.chomp
    break if name.empty?
    puts "Age, if I may ask?"
    age = gets.chomp
    puts "Which cohort"
    cohort = gets.chomp
  end
  students
end

def print_by_letter(names)
#  array_names = []


  puts "View by letter?"
  letter = gets.chomp

  names.each do |student|
    first_letter = student[:name].to_s[0].downcase
    puts student[:name] if letter == first_letter
  end
end

def print_shorter_than(names)

  puts "View by names shorter than?"
  length = gets.chomp.to_i

  names.each do |student|
    names_length = student[:name].to_s.length
    puts student[:name] if names_length < length
  end
end

def group_by_month(names)

  puts "Group by month?"
  month = gets.chomp
  students = names.select do |student|
    student if student[:cohort] == month
  end
  return students
end

def interactive_menu
students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"

    selection = gets.chomp

    case selection
    when "1"
        students = input_students
      when "2"
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit
      else
        puts "I don't know what you meant, try again"
    end
  end
end


interactive_menu
#students = input_students
#print_header
#students_by_month = group_by_month(students)
#print(students)
#print_footer(students)
#print_shorter_than(students)
#print_by_letter(students)
