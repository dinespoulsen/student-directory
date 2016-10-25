@students = []
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

def print_student_list
  exit if @students.empty?
  i = 0
  while i < @students.length
    output = "#{i + 1}: #{@students[i][:name]}, age #{@students[i][:age]} (#{@students[i][:cohort]} cohort)"
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
  name = gets.chomp

  while !name.empty? do
    puts "Age, if I may ask?"
    age = gets.chomp
    puts "Which cohort"
    cohort = gets.chomp
    cohort.empty? ? cohort = "November" : cohort
    @students << {name: name, cohort: cohort, age: age}
    if @students.count > 1 || @students.count == 0
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} student"
    end

    puts "Please enter the name of another student"
    puts "To finish, just hit return twice"
    name = gets.chomp
    break if name.empty?
  end
  return @students
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

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer(@students)
end

def process(selection)
  case selection
  when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "List saved!"
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
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
