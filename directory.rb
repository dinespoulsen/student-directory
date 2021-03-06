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
  name = STDIN.gets.chomp

  while !name.empty? do
    puts "Age, if I may ask?"
    age = STDIN.gets.chomp
    puts "Which cohort"
    cohort = STDIN.gets.chomp
    cohort.empty? ? cohort = "November" : cohort
    add_students(name, cohort, age)
    puts "#{name} was added to the list"
    puts @students.count > 1 || @students.count == 0 ? "Now we have #{@students.count} students" : "Now we have #{@students.count} student"

    puts "Please enter the name of another student"
    puts "To finish, just hit return twice"
    name = STDIN.gets.chomp
    break if name.empty?
  end
  return @students
end

def print_by_cohort
#  array_names = []

  puts "View by which month?"
  month = STDIN.gets.chomp
  month = month.downcase!

  @students.each do |student|

    student_month = student[:cohort].downcase
    puts student[:name] if month == student_month
  end
end

def print_shorter_than(names)

  puts "View by names shorter than?"
  length = STDIN.gets.chomp.to_i

  names.each do |student|
    names_length = student[:name].to_s.length
    puts student[:name] if names_length < length
  end
end

def group_by_month(names)

  puts "Group by month?"
  month = STDIN.gets.chomp
  students = names.select do |student|
    student if student[:cohort] == month
  end
  return students
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "5. Clear the student list"
  puts "6. List students by cohort"
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
    when "4"
      load_students
    when "5"
      clear_list
    when "6"
      print_by_cohort
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def save_students
  puts "What file would you like to save it to?"
  filename = STDIN.gets.chomp
  file = File.open(filename, "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:age]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "List saved!"
end

def try_load_students
  filename = ARGV.first
  filename.nil? ? filename = "students.csv" : return
    if File.exists?(filename)
      load_students(filename)
      puts "Loaded #{@students.count}"
    else
      puts "Sorry #{filename} doesn't exist"
      exit
    end
end

def add_students(name, cohort, age)
  @students << {name: name, cohort: cohort, age: age}
end

def clear_list
puts @students.clear ? "List cleared" : "Couldn't clear list"
end

def load_students(filename = "students.csv")
@students.clear
  File.open(filename, "r") do |file|
    file.readlines.each do |line|
      name, cohort, age = line.chomp.split(",")
      add_students(name, cohort, age)
    end
  end
end

def interactive_menu
  try_load_students
  loop do
    print_menu
    process(STDIN.gets.chomp)
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
