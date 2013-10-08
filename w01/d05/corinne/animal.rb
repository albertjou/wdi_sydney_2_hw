# require 'pry'

class Animal
attr_accessor :name, :age, :gender, :species, :toys

  def initialize
    puts "What is your animal's name?"
    @name = gets.chomp.downcase
    puts "What is #{@name.capitalize}'s age? (in years)"
    @age = gets.chomp.to_i
    puts "What is #{@name.capitalize}'s gender? (male/female)"
    @gender = gets.chomp.downcase
    puts "What species is #{@name.capitalize}?"
    @species = gets.chomp.downcase
    @toys = []
    puts "What is one of #{@name.capitalize}'s favourite toys?"
    @toys << gets.chomp.downcase
    puts "Would you like to add another toy? (Y/N)"
    more_toys = gets.chomp.downcase
    while more_toys == "y"
      puts "Add the next toy:"
      @toys << gets.chomp.downcase
      puts "Would you like to add another toy? (Y/N)"
      more_toys = gets.chomp.downcase
    end
  end

  # def to_s()
  #   puts "#{name.capitalize} is a #{age} year old #{species} whose favourite toys are #{toys}."
  # end

end


# binding.pry