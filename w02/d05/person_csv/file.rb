f = File.new('database.txt', 'a+')

print "write info to file (y/n): "
response = gets.chomp.downcase

while response == 'y'
  print "Enter name, age, gender: "
  f.puts(gets.chomp)

  print "write info to file (y/n): "
  response = gets.chomp.downcase
end


f.close

# File.new('database.txt', 'a+') do |file|  
# end

class Person
  attr_accessor :name, :age, :gender

  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
  end

  def to_s
    "#{@name} is a #{@age} year old #{@gender}"
  end
end

f = File.new('database.txt', 'r')

people = []

f.each do |line|

  person_array = line.chomp.split(',')

  person = Person.new(person_array[0], person_array[1], person_array[2])

  people << person
end

f.close

people.each do |person|
  puts "The person is: #{person}"
end





