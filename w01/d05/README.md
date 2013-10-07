
## GA Stock Exchange Lab (Weekend Homework)

**Objectives:**

* Build an Ruby program using test-driven development that reviews concepts learned this week.

**Activity:**

Students will create a stock management program using TDD. Use Pivotal Tracker and GitHub. These are the things the program should be able to do:
* Create an account for client (name, balance).
* Every client can create multiple portfolios.
* A client can buy stocks at market rate; these stocks will be added to a portfolio and the purchase amount subtracted from cash. (You cannot go to a negative cash balance).
* A client can sell a stock. The proceeds go into his account.
* List all client portfolios and their values (each portfolio value and sum of portfolio values) and the account balance.
* List all stocks in a portfolio.
* List all clients.

**Note:**

Each time a portfolio balance is calculated, the program needs to go out to the web and get current stock prices.

Show students how to install the yahoofinance gem, and require it in the necessary ruby files. Demonstrate how the gem works for students. For example:

YahooFinance::get_quotes(YahooFinance::StandardQuote, 'AAPL')['AAPL'].lastTrade

=> 453.62

require 'yahoofinance'

# Set the type of quote we want to retrieve.
# Available type are:
#  - YahooFinance::StandardQuote
#  - YahooFinance::ExtendedQuote
#  - YahooFinance::RealTimeQuote
quote_type = YahooFinance::StandardQuote

# Set the symbols for which we want to retrieve quotes.
# You can include more than one symbol by separating
# them with a ',' (comma).
quote_symbols = "yhoo,goog"

# Get the quotes from Yahoo! Finance.  The get_quotes method call
# returns a Hash containing one quote object of type "quote_type" for
# each symbol in "quote_symbols".  If a block is given, it will be
# called with the quote object (as in the example below).
YahooFinance::get_quotes( quote_type, quote_symbols ) do |qt|
    puts "QUOTING: #{qt.symbol}"
    puts qt.to_s
end

# You can get the same effect using the quote specific method.
quotes = YahooFinance::get_standard_quotes( quote_symbols )
quotes.each do |symbol, qt|
    puts "QUOTING: #{symbol}"
    puts qt.to_s
end