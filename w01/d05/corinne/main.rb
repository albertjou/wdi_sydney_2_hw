require_relative 'animal'
require_relative 'client'
require_relative 'shelter'
require 'pry'

def menu
  puts "Welcome to the HappiShelter, please choose from the following options:
    1 : View a list of our animals
    2 : View a list of our clients
    3 : Add an animal to the shelter
    4 : Become a potential animal parent
    5 : Adopt an animal
    6 : Add an animal to our shelter ready for adoption
    Q : Quit"
  menu_response = gets.chomp.to_s.downcase
end

$animal_hash = {}
$client_hash = {}

def view_animals
  puts $animal_hash
end

def view_clients
  puts $client_hash
end

def add_animal
  new_animal = Animal.new
  $animal_hash[new_animal.name] = new_animal
end

def add_client
  new_client = Client.new
  $client_hash[new_client.name] = new_client
end

def are_you_a_client
  puts "are you already a client? (Y/N)"
  already_client = gets.chomp.downcase
    if already_client == 'y'
      puts "Here is our list of clients, which one are you?"
      puts $client_hash.keys
      name = gets.chomp.downcase
      @adopting_client = $client_hash[name]
    else
        add_client
    end
end

def pet_choice
  puts $animal_hash
  puts "Please select from the choices above"
  pet_name = gets.chomp.downcase
  @pet_to_adopt = $animal_hash[pet_name]
end

def adoption
  $animal_hash.delete(@pet_to_adopt)
  @adopting_client.pets << @pet_to_adopt
end

def add_adoptee
  new_animal = Animal.new
  $animal_hash[new_animal] = new_animal
end

menu_response = menu
while menu_response != 'q'
    if menu_response == '1'
      view_animals
      puts menu
    elsif menu_response == '2'
      view_clients
      puts menu
    elsif menu_response == '3'
      add_animal
      puts menu
    elsif menu_response == '4'
      add_client
      puts menu
    elsif menu_response == '5'
      are_you_a_client
      pet_choice
      adoption
      puts menu
    else
      add_adoptee
      puts menu
    end
  menu_response = gets.chomp.to_s.downcase
end


binding.pry
