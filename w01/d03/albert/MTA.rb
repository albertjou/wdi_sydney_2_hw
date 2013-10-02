#Title: MTA Lab

# The list of stations for each line

n_line = ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"]
l_line = ["8th", "6th", "Union Square", "3rd", "1st"]
six_line = ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]



# The menu
puts "Which line do you want to start from:"
starting_point_line = gets.chomp
  case starting_point_line
  when "n_line"
    puts "You have selected the N line"
    puts "What station do you want to start at"
    station_start = gets.chomp
    station_start_index = n_line.index(station_start)
    puts "Are you staying on the same line?"
    same_line = gets.chomp
      if same_line == "yes"
        puts "What station do you want to get off at"
        station_end = gets.chomp
        station_end_index = n_line.index(station_end)
        puts n_line[station_start_index .. station_end_index]
      elsif same_line == "no"
        puts "What line do you want to stop at"
        station_end_line = gets.chomp
        puts "What stop do you want to get to"
        station_end = gets.chomp
        puts n_line[station_start_index ..4]
        puts "Now change to the #{station_end_line}"
        puts
      else
        puts "Sorry, I don't understand"
      end


  when "l_line"
    puts "You have selected the L line"
    puts "What station do you want to start at"
    station_start = gets.chomp
    station_start_index = l_line.index(station_start)
    puts "Are you staying on the same line?"
    same_line = gets.chomp
      if same_line == "yes"
        puts "What station do you want to get off at"
        station_end = gets.chomp
        station_end_index = l_line.index(station_end)
        puts l_line[station_start_index .. station_end_index]
      elsif same_line == "no"
        puts "What line do you want to stop at"
        station_end_line = gets.chomp
        puts "What stop do you want to get to"
        station_end = gets.chomp
        puts l_line[station_start_index ..4]
      else
        puts "Sorry, I don't understand"
      end
  when "six_line"
    puts "You have selected the 6 line"
    puts "What station do you want to start at"
    station_start = gets.chomp
    station_start_index = six_line.index(station_start)
    puts "Are you staying on the same line?"
    same_line = gets.chomp
      if same_line == "yes"
        puts "What station do you want to get off at"
        station_end = gets.chomp
        station_end_index = n_line.index(station_end)
        puts six_line[station_start_index .. station_end_index]
      elsif same_line == "no"
        puts "What line do you want to stop at"
        station_end_line = gets.chomp
        puts "What stop do you want to get to"
        station_end = gets.chomp
        puts six_line[station_start_index ..4]
      else
        puts "Sorry, I don't understand"
      end
  else
    puts "sorry I don't recognise that line"
  end


  # puts "What about the station?"
  # starting_point = n_line.index(gets.chomp.to_s)
  # # puts "Which line do you want to end at:"
  # # end_point_line = gets.chomp
  # # puts "What about the station?"
  # # end_point = end_point_line.index(gets.chomp)
  # # puts "#{end_point}"

  # # if starting_point_line == end_point_line
  #   puts "#{starting_point_line[starting_point]}"
  # # else
  # #   puts "Ok"
  # # end
