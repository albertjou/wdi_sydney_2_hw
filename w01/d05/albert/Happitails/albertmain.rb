require_relative 'animal'
require_relative 'client'
require_relative 'shelter'
require 'pry'

#Need two arrays, one for animal (animal_array) and one for client (client_array)

def menu
  puts "Welcome to your local shelter"
  puts "(A)\tTo add a new client\n(B)\tTo abandon an animal\n(C)\tTo adopt an animal\n(Z)\tFor admin features\n(Q)\tTo quit"
  gets.chomp
end

system "clear" unless system "cls"
shelter1 = Shelter.new

# binding.pry
response = menu
while response != "Q"
  case response
  when "A"
    shelter1.add_client
  when "B"
    shelter1.abandon_animal
  when "C"
    shelter1.adopt_animal
  when "Z"
    puts "The list of animals:"
    shelter1.animals_list.each {|x| x.display}
    puts"\nThe list of clients:"
    shelter1.clients_list.each {|x| x.display}
  end
  response = menu
end




  # animal_array = [up for adoption]
  # each new animal is created in animal_array
  # which means each element in the array is an objectID
  # when a client takes an animal, it gets removed from the array


  # client_array = [only gets bigger, doesn't get smaller]
  # each new client is created in client_array