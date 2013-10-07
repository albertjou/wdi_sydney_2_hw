#To do, allow for people with the same name

class Shelter
  attr_accessor :animals_list, :clients_list

  def initialize
    @animals_list = []
    @clients_list = []
  end

#How to add checking of duplicate clients...Do a name check first, if the same, prompt to see if they have been here before.

  def add_client
    check = true
    new_client = Client.new
    temp_check = @clients_list.select {|x| x.name == new_client.name}
    # if temp_check.length > 1 #Trying to figure out a way to do multiple
    #   temp_check.each {|x|
    if temp_check.first != nil && temp_check.first.age == new_client.age
      puts "We already have another client with the same name and age, #{new_client.name} have you been here before? (Y/N)"
      answer = gets.chomp
      if answer == "Y"
        puts "Would you like to update your details? (Y/N)"
        answer = gets.chomp
        check = false
        if answer == "Y"
          @clients_list.delete(temp_check.first)
          @clients_list << new_client
          check = false
        end
      else
        new_client.name = new_client.name + " #{temp_check.length+1}"
      end
    end
    if check == true
    @clients_list << new_client
    end
  end

  def adopt_animal
    puts "Who wants to adopt the animal"
    temp_client = get_client
    puts "Which animal do you want to adopt"
    temp_animal = get_animal
    @animals_list.delete(temp_animal)
    temp_client.adopted_pets << temp_animal
    temp_client.num_pets +=1
    puts "You have adopted #{temp_animal}"
  end

  def get_client
    @clients_list.each {|x| puts x.name}
    name_temp = gets.chomp
    if (@clients_list.select {|x| x.name == name_temp}.first == nil)
      puts "Sorry, you aren't on our database, let's get you listed."
      @clients_list << Client.new
      @clients_list.last
    else
      @clients_list.select {|x| x.name == name_temp}.first
    end
  end

  def get_animal
    if @animals_list.length == 0
      puts "Sorry, we don't have any pets at the moment."
    else
      @animals_list.each {|x| puts x.name} #list animals
      name_temp = gets.chomp
      if (@animals_list.select {|x| x.name == name_temp}.first == nil)
        puts "Sorry, I don't recogonise that animal"
      else
        @animals_list.reject! {|x| x.name == name_temp}.first
      end
    end
  end

####FIX THIS CODE######
  def abandon_animal
    puts "Who wants to abandon their animal"
    temp_client = get_client
    if (temp_client.num_pets > 0)
      if (temp_client.adopted_pets.length > 0)
        puts "Did the animal come from our shelter? (Y/N)"
        if gets.chomp == "Y"
          puts "This is the list of the adopted pets"
          temp_client.adopted_pets.each {|x| puts x.display}
          puts "Which one do you want to abandon"
          @animals_list << temp_client.adopted_pets.reject! {|x| x.name == gets.chomp}.first
          temp_client.num_pets -=1
        end
      else
        puts "What are the details of the animal you are abandoning"
        @animals_list << Animal.new
        temp_client.num_pets -=1
      end
    else
      puts "Sorry, you don't have any pets"
    end
  end
end
