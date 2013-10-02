# A user should be given a menu of operations
# A user should be able to choose from the menu
def menu
  puts "Hello, welcome to the calculator\n#{"*****"*10}"
  puts "There are two calculators:\n\t(b)\tFor basic\n\t(adv)\tFor advanced (power and square root)\nIf you want to quit, just put in 'q'."
  gets.chomp.downcase
end

def inputs
  print "="
  gets.chomp.to_i
end

# A user should be able to enter numbers to perform the operation on
# A user should be shown the result
def basic_calc
  print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "
  command = gets.chomp.downcase
  case command
  when "a"
    puts "Addition\nPlease provide numbers"
    first_num = inputs
    inputs + first_num
  when "s"
    puts "Subtracting\nPlease provide numbers"
    first_num = inputs
    first_num - inputs
  when "m"
    puts "Multiplication"
    first_num = inputs
    first_num * inputs
  when "d"
    puts "Division"
    first_num = inputs.to_f
    second_num = inputs
    if second_num != 0
      first_num/inputs
    else
      puts "Sorry, can't divide by 0"
      second_num = inputs
    end
  else
    print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "
    command = gets.chomp.downcase
  end
end

def advanced_calc
  print "(p)ower, (s)qrt, (r)oot: "
  command = gets.chomp.downcase
  # unless command == "p" || command == "s"
  #   puts "Sorry, that's not a valid command"
  #   command = gets.chomp
    if command == "p"
      first_num = inputs
      first_num ** inputs
    elsif command == "s"
      Math.sqrt(inputs)
    else
      puts "x ^ (1/n)\nx"
      first_num = inputs.to_f
      puts "n"
      second_num = inputs.to_f
      first_num ** (1/second_num)
    end
end

system "clear" unless system "cls"
response = menu

# This process should continue until the user selects a quit option from the menu
while response != "q"
  if response == "b"
    answer = basic_calc
  elsif response == "adv"
    answer = advanced_calc
  end
  puts "The answer is: #{answer}\n\n\n"
  response = menu
end
puts "Thanks for using this awesome calculator"