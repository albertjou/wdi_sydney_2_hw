class Client
  attr_accessor :name, :num_children, :age, :num_pets, :adopted_pets

  def initialize
    @adopted_pets = []
    puts "Firstly, please tell me your name"
      @name = gets.chomp.capitalize
    puts "Thanks #{@name}! Do you have any children Y/N?"
        if gets.chomp.downcase == "y"
          puts "How lovely, how many of the little devils do you have?"
          @num_children = gets.chomp.to_i
        else
          @num_children = 0
        end
    puts "No problem, how old are you #{@name}?"
      @age = gets.chomp.to_i
    puts "So young! Do you already have any pets Y/N?"
        if gets.chomp.downcase == "y"
          puts "How many do you have?"
          @num_pets = gets.chomp.to_i
        else
          @num_pets = 0
        end
  end

  def display
    puts "#{@name} is #{@age} and has #{@num_children} children. #{@adopted_pets.length} of their #{@num_pets} pets is from us"
  end
end
