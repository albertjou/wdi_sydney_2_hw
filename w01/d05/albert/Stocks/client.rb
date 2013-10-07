require 'pry'
require_relative 'portfolio'

class Client
  attr_accessor :name, :balance, :portfolios

  def initialize
    puts "What is the full name of the client"
    @name = gets.chomp
    puts "What will your initial deposit be (to the nearest dollar)"
    @balance = gets.chomp.to_f.round(2)
    @portfolios = {}
    puts "Great! Let's get a portfolio set up."
    new_port = Portfolio.new
    @portfolios[new_port.name] = new_port
  end

  def add_portfolio
    new_portfolio = Portfolio.new
    @portfolios[new_portfolio.name] = new_portfolio
  end

  def list_portfolios
    puts "Account balance: $#{@balance.round(2)}\n"
    display_list = []
    @portfolios.each_value do |portfolio|
        display_string = "#{portfolio.name} - #{portfolio.total_value}"
        puts display_string
        display_list << display_string
    end
    display_list
  end

  def add_funds
    puts "How much are you depositing today"
    @balance += gets.chomp.to_f.round(2)
    puts "Thank you, your new balance is now: $#{@balance.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse}, happy trading"
  end

  def buy_stock
    puts "Which portfolio do you want to purchase stocks from"
    list_portfolios
    portfolio_temp = @portfolios[gets.chomp]
    if portfolio_temp == nil
      puts "That portfolio doesn't exist, do you want to create it now (Y/N)?"
      answer = gets.chomp
      if answer == "Y"
        add_portfolio
      else
        puts "Please select a different portfolio"
      end
    else
      code = portfolio_temp.get_code
      quote = portfolio_temp.get_quote(code)
      puts "#{code} is currently trading at #{quote}."
      puts "How much do you want to buy, maximum is #{(@balance/quote).round(4)} shares."
      quantity = gets.chomp.to_i
      if (quantity) > (@balance/quote)
        puts "Sorry, you can't afford that"
      else
        portfolio_temp.stocks[code] || portfolio_temp.stocks[code] = 0
        portfolio_temp.stocks[code] += quantity
        @balance -= (quantity*quote)
      end
    end
  end

  def sell_stocks
    puts "Which portfolio do you want to sell stocks from"
    list_portfolios
    portfolio_temp = @portfolios[gets.chomp]
    if portfolio_temp == nil
      puts "That portfolio doesn't exist. Please select a different portfolio"
    else
      portfolio_temp.total_value
      puts "Which one do you want to sell?"
      sell_me = gets.chomp.upcase
      if portfolio_temp.stocks[sell_me] == nil
        puts "Sorry don't recognise that code"
      else
        puts "The maximum you can sell is #{portfolio_temp.stocks[sell_me]} shares"
        quantity = gets.chomp.to_i
        if quantity > portfolio_temp.stocks[sell_me]
          puts "You don't have that many shares"
        else
          portfolio_temp.stocks[sell_me] -= quantity
          @balance += quantity * portfolio_temp.get_quote(sell_me)
        end
      end
    end

#Saving the information of each Client into a file?
  File.open('/Users/user/Learning/WDI/Projects/wdi_sydney_2_hw/w01/d05/albert/Stocks/data.rb', 'w') {|f| f.write(Marshal.dump([@name, @balance, @portfolios])) }
  end


end

target = "target.rb"
content =

File.open(target, "w+") do |f|
  f.write(content)
end


binding.pry