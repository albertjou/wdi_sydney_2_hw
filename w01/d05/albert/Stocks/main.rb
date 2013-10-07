#I have not integrated the menu into stocks.rb yet

require_relative 'client'
require_relative 'portfolio'

class Firm
  attr_accessor :clients

  def initialize
    @clients = {}
  end

  def list
    @clients.each_key {|x| puts x}
  end
end

def menu
  puts "These are the options"
  puts "A: See list of clients"
  puts "B: Add a client"
  puts "C: Buy stocks"
  puts "D: Sell stocks"
  puts "E: Add funds"
  puts "F: Quit"

  answer = gets.chomp

  case answer
  when "A"


  when "B"


end

