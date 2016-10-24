#first we print the list of students
def print_header
  puts   "The students of Villains Academy"
  puts "------------"
end

def print(names)
  names.each_with_index do |student, i|
    puts "#{i + 1}: #{student[:name]} (#{student[:cohort]} cohort)" if student[:name].to_s.length < 12
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

  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"

    name = gets.chomp
  end
  students
end

def print_by_letter(names)
#  array_names = []


  puts "Sort by letter?"
  letter = gets.chomp

  names.each do |student|
    first_letter = student[:name].to_s[0].downcase
    puts student[:name] if letter == first_letter
  end
end

def print_shorter_than(names)

  puts "Sort by names shorter than?"
  length = gets.chomp.to_i

  names.each do |student|
    names_length = student[:name].to_s.length
    puts student[:name] if names_length < length
  end
end


students = input_students
print_header
print(students)
print_footer(students)
print_shorter_than(students)
#print_by_letter(students)
