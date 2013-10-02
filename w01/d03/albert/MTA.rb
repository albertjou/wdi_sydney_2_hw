#Title: MTA Lab

# This method outputs the stations required to get from A --> B (on the same line)

def same_line(line, start_index, end_index)
  if (start_index > end_index)
    start_index = reverse_direction(line, start_index)
    end_index = reverse_direction(line, end_index)
    line.reverse!
    line[start_index..end_index]
  elsif start_index == end_index
    "\nBuddy, have a look around, you are already there...\n"
  else
    line[start_index..end_index]
  end
end

#This method is where the data for subway lines are stored.
# It also takes an input for the line and returns the array of stations for the relevant line.
# TO DO: UNKNOWN INPUT HANDLING

def journey_line()
  subway_system = {
    :n_line => ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"],
    :l_line => ["8th", "6th", "Union Square", "3rd", "1st"],
    :six_line => ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]
  }
  puts "N Line stations (n_line):\n #{subway_system[:n_line]}"
  puts ""
  puts "L Line stations (l_line):\n #{subway_system[:l_line]}"
  puts ""
  puts "6 Line stations (six_line):\n #{subway_system[:six_line]}"
  print "\nLine?\t\t"
  return subway_system[gets.chomp.to_sym]
end

# This method asks for the station and converts it into an index number.
# TO DO: UNKNOWN INPUT HANDLING

def journey_station(line)
  print "Station?\t"
  return line.index(gets.chomp)
end

# Reverses the value's array index number.
def reverse_direction(line, index)
  return line.reverse.index(line[index])
end

# This is just a bit of fun...

def draw_me_a_train
  puts %Q{            .---- -  -
   (   ,----- - -
    \_/      ___
    c--U---^--'o  [_
    |------------'_|   MTA ROUTE OPTIMIZER
    /_(o)(o)--(o)(o)    *******************
    ~ ~~~~~~~~~~~~~~~~~~~~~~~~
  }
end

system "clear" unless system "cls"

draw_me_a_train
puts "Where do you want to start:"
puts ""
start_line = journey_line
start_index = journey_station(start_line)
print "Do you want to stay on the same line? (Y/N)?  "
response = gets.chomp.upcase
if response[0] == "Y"
  end_index = journey_station(start_line)
  print "\nThe trip from #{start_line[start_index]} to #{start_line[end_index]} is #{same_line(start_line, start_index, end_index).count} stops total:"
  puts ""
  print same_line(start_line, start_index, end_index)
elsif response[0] == "N"
  puts ""
  end_index = start_line.index("Union Square")
  part_one = same_line(start_line, start_index, end_index)
  puts "Which line do you want to go to:"
  end_line = journey_line
  if end_line == start_line
    puts "You are already on that line, which other line do you want to go to?"
    end_line = journey_line
  end
  end_index = journey_station(end_line)
  # puts "First you travel to Union Square, the "
  start_index_new = end_line.index("Union Square")
  part_two = same_line(end_line, start_index_new, end_index)
  part_two.shift
  print "\nThe trip from #{part_one.first} to #{part_two.last} is #{(part_one+part_two).count} stops total:"
  puts ""
  print part_one + part_two
else
  puts "Sorry, I only take yes/no answers."
  quit
end
puts ""
puts "Have a safe trip\n\n\n"

# Extension

# What happens if there is another line that touches n_line at 23rd and six_line at Astor Place

# subway_system_new = {
#   :my_line => ["23rd", "Happy Land", "Zombieville", "Astor Place", "End of the line"]
#   :n_line => ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"],
#   :l_line => ["8th", "6th", "Union Square", "3rd", "1st"],
#   :six_line => ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]
# }

# We would need to create a table of connections?

# Select the shortest route that goes to either 23rd @ n_line or Astor Place @ six_line



# Extension extension. If there were multiple connections, we would aim to prioritise minimum switches




