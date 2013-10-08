# Write a program that will take a year and report if it is a leap year. The tricky
#   thing here is that a leap year occurs:

# on every year that is evenly divisible by 4
# except every year that is evenly divisible by 100
# except every year that is evenly divisible by 400.


year = Year.new(1996)
year.leap?

or

Year.new(1996).leap?


=begin
  create an attr for year
  create a def for the function above
create a function that will determin if the number is that qualifies as a leap year


=end

attr_accessor :year

def leap
  Year.new(:year).leap?
end

  if (year / 4).is_i?
    if

