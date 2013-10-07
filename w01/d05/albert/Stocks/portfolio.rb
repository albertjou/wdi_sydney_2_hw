require 'yahoofinance'

class Portfolio
  attr_accessor :name, :stocks

  def initialize
    puts "What is the name of the portfolio"
    @name = gets.chomp
    @stocks = {}
    # puts "Do you want to buy some stocks now? (Y/N)"
    # answer = gets.chomp.upcase
    # if answer == "Y"
    #   code = get_code
    #   quote = get_quote(code)
    #   puts "#{code} was last traded at $#{quote}."
    #   buy_stock(code, quote)
    # end
  end

  def get_code
    puts "What stock do you want to look up, for Australian stocks please end it with '.AX' for example, ANZ would be 'ANZ.AX'"
    gets.chomp.upcase
  end

  def get_quote(stock)
    raise(RuntimeError, "Stock does not exist.") if YahooFinance::get_quotes(YahooFinance::StandardQuote, stock)[stock].nil?
    YahooFinance::get_quotes(YahooFinance::StandardQuote, stock)[stock].lastTrade
  end

  def total_value
    value = 0
    @stocks.each_key { |key| value += (get_quote(key.dup) * @stocks[key]) }
    @stocks.each_key {|key| puts "#{key} = #{@stocks[key]} shares. Current market value = $#{get_quote(key.dup).to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse} per share"}
    puts value
  end

end


# require 'yahoofinance'

# class Portfolio
#   attr_accessor :name, :stocks, :owner

#   def initialize(name, owner, stocks = {})
#     @name = name
#     @owner = owner
#     @stocks = stocks
#   end

#   def self.get_current_stock_price(stock_name)
#     # Class method because behavior does not change between instances
#     raise(RuntimeError, "Stock does not exist.") if YahooFinance::get_quotes(YahooFinance::StandardQuote, stock_name)[stock_name].nil?
#     YahooFinance::get_quotes(YahooFinance::StandardQuote, stock_name)[stock_name].lastTrade
#   end

#   def buy_stock(stock_name, num_stocks)
#     total_cost = Portfolio.get_current_stock_price(stock_name) * num_stocks
#     raise(RuntimeError, "Insufficient account funds.") if @owner.balance < total_cost
#     @stocks[stock_name] ||= 0 # Initialize stock if not already in existence
#     @stocks[stock_name] += num_stocks
#     @owner.balance -= total_cost
#   end

#   def list_stocks_held
#     stocks.keys.each {|stock| puts stock}
#   end

#   def sell_stock(stock_name, num_stocks)
#     raise(RuntimeError, "Stock not in portfolio") if @stocks[stock_name].nil?
#     raise(RuntimeError, "Insufficient shares for this sale") if @stocks[stock_name] - num_stocks < 0
#     @stocks[stock_name] -= num_stocks
#     @owner.balance += (Portfolio.get_current_stock_price(stock_name) * num_stocks)
#   end

#   def get_total_value
#       value = 0
#       @stocks.each_key { |key| value += (Portfolio.get_current_stock_price(key.dup) * @stocks[key]) }
#       value
#   end

#   def portfolio_value
#     results = []
#     @stocks.each do |stock_symbol, num_shares|
#       ticker =  stock_symbol.dup
#       results.push "Your #{num_shares} shares of #{ticker} are worth $ #{Portfolio.get_current_stock_price(ticker)} \n"
#     end
#     results
#   end
# end