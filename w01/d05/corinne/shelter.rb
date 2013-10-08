
class Shelter
  attr_accessor :animals, :clients

  def initialize
    @animals_hash = {}
    @clients_hash = {}
  end

  def add_animal(animal)
    if (animal.is_a?Animal)
      @animals << animal
    else
      puts "Sorry, #{animal} is not an animal"
    end
  end

  def add_client(client)
    if (client.is_a?Client)
      @clients << client
    else
      puts "Sorry, #{client} is not a client"
    end
  end



end

# binding.pry
