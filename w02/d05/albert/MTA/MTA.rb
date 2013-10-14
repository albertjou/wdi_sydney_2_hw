require 'pry'
require 'sinatra'
require 'sinatra/reloader'


get '/' do
  if @start != nil
    @start = params[:start]
    @final = params[:final]
    @start_line = @start.to_s[0] # Just starting line
    @final_line = @final.to_s[0] # Just finishing line
    @start_stn = @start.to_s.reverse.chop.chop.reverse # Just starting station
    @final_stn = @final.to_s.reverse.chop.chop.reverse # Just finishing station

    # Same everything
    if @final == @start
      @answer = "You are already at your destination"

    # Same line
    elsif @start_line == @final_line
      @answer = "This is your journey"
      @journey = same_line(@start_line, @start_stn, @final_stn)

    # Different line
    else
      @journey = same_line(@start_line, @start_stn, "Union Square")
      @journey += same_line(@final_line, "Union Square", @final_stn).shift
      @answer = "This is your journey"
    end
  end
    erb :form
end


def same_line(line, start_index, end_index)
  if (start_index > end_index)
    start_index = reverse_direction(line, start_index)
    end_index = reverse_direction(line, end_index)
    line.reverse!
    line[start_index..end_index]
  else
    line[start_index..end_index]
  end
end

def reverse_direction(line, index)
  return line.reverse.index(line[index])
end

# def journey_line()
#   subway_system = {
#     :n_line => ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"],
#     :l_line => ["8th", "6th", "Union Square", "3rd", "1st"],
#     :six_line => ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]
#   }
#   puts "N Line stations (n_line):\n #{subway_system[:n_line]}"
#   puts ""
#   puts "L Line stations (l_line):\n #{subway_system[:l_line]}"
#   puts ""
#   puts "6 Line stations (six_line):\n #{subway_system[:six_line]}"
#   print "\nLine?\t\t"
#   return subway_system[gets.chomp.to_sym]
# end

# def journey_station(line)
#   print "Station?\t"
#   return line.index(gets.chomp)
# end

# Reverses the value's array index number.


# system "clear" unless system "cls"

# draw_me_a_train
# puts "Where do you want to start:"
# puts ""
# start_line = journey_line
# start_index = journey_station(start_line)
# print "Do you want to stay on the same line? (Y/N)?  "
# response = gets.chomp.upcase
# if response[0] == "Y"
#   end_index = journey_station(start_line)
#   print "\nThe trip from #{start_line[start_index]} to #{start_line[end_index]} is #{same_line(start_line, start_index, end_index).count} stops total:"
#   puts ""
#   print same_line(start_line, start_index, end_index)
# elsif response[0] == "N"
#   puts ""
#   end_index = start_line.index("Union Square")
#   part_one = same_line(start_line, start_index, end_index)
#   puts "Which line do you want to go to:"
#   end_line = journey_line
#   if end_line == start_line
#     puts "You are already on that line, which other line do you want to go to?"
#     end_line = journey_line
#   end
#   end_index = journey_station(end_line)
#   # puts "First you travel to Union Square, the "
#   start_index_new = end_line.index("Union Square")
#   part_two = same_line(end_line, start_index_new, end_index)
#   part_two.shift
#   print "\nThe trip from #{part_one.first} to #{part_two.last} is #{(part_one+part_two).count} stops total:"
#   puts ""
#   print part_one + part_two
# else
#   puts "Sorry, I only take yes/no answers."
#   quit
# end
# puts ""
# puts "Have a safe trip\n\n\n"


