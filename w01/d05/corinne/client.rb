# require 'pry'

class Client
  attr_accessor :name, :num_children, :age, :num_pets, :pets

  def initialize
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
    @pets = []
end


end



# binding.pry