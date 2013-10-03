# Leap year program
require 'pry'

class Year
  def initialize(year)
    @year = year.to_i
  end

  def leap
    puts ((@year%4==0) &&
      ((@year%100 != 0) || (@year%400 == 0)))?
    "#{@year} is a leap year. It has 366 days" :
    "#{@year} is not a leap year. It has 365 days"
  end

end

binding.pry