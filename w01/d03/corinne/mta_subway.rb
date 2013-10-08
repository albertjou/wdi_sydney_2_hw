# require "pry"

def q_start_line
  puts "On which line are you starting your trip? : "
end

def q_start_station
  puts "At which station are you starting your trip? : "
end

def q_end_line
  puts "On which line are you ending your trip? : "
end

def q_end_station
  puts "At which station are you ending your trip? : "
end

def all_lines
    puts "
      N : North line
      L : L line
      S : 6 (Sixth) line"
end

def n_stations
    puts "
      NTS : Times Square
      N34 : 34th
      N28 : 28th
      N23 : 23rd
      US : Union Square
      N08 : 8th"
end

def l_stations
    puts "
      L08 : 8th
      L06 : 6th
      US : Union Square
      L03 : 3rd
      L01 : 1st"
end

def s_stations
    puts "
      SGC : Grand Central
      S33 : 33rd
      S28 : 28th
      S23 : 23rd
      US : Union Square
      SAP : Astor Place"
end

subway_lines = {
  :Nline => ["NTS", "N34", "N28", "N23", "US", "N08"],
  :Lline => ["L08", "L06", "US", "L03", "L01"],
  :Sline => ["SGC", "S33", "S28", "S23", "US", "SAP"]
}





puts "




---- Welcome to NY Subway ----




"
puts q_start_line
puts all_lines
start_line=gets.chomp.upcase

case start_line
  when "N"
    puts q_start_station
    puts n_stations
    start_stop = gets.chomp.upcase
    puts q_end_line
    puts all_lines
    end_line = gets.chomp.upcase
      case end_line
        when "N"
          puts q_end_station
          puts n_stations
          end_stop = gets.chomp.upcase
        when "L"
          puts q_end_station
          puts l_stations
          end_stop = gets.chomp.upcase
        when "S"
          puts q_end_station
          puts s_stations
          end_stop = gets.chomp.upcase
      end
  when "L"
    puts q_start_station
    puts l_stations
    start_stop = gets.chomp.upcase
    puts q_end_line
    puts all_lines
    end_line = gets.chomp.upcase
      case end_line
        when "N"
          puts q_end_station
          puts n_stations
          end_stop = gets.chomp.upcase
        when "L"
          puts q_end_station
          puts l_stations
          end_stop = gets.chomp.upcase
        when "S"
          puts q_end_station
          puts s_stations
          end_stop = gets.chomp.upcase
      end
  when "S"
    puts q_start_station
    puts s_stations
    start_stop = gets.chomp.upcase
    puts q_end_line
    puts all_lines
    end_line = gets.chomp.upcase
      case end_line
        when "N"
          puts q_end_station
          puts n_stations
          end_stop = gets.chomp.upcase
        when "L"
          puts q_end_station
          puts l_stations
          end_stop = gets.chomp.upcase
        when "S"
          puts q_end_station
          puts s_stations
          end_stop = gets.chomp.upcase
      end
end



n_start_index_number = subway_lines[:Nline].index start_stop
n_end_index_number = subway_lines[:Nline].index end_stop
l_start_index_number = subway_lines[:Lline].index start_stop
l_end_index_number = subway_lines[:Lline].index end_stop
s_start_index_number = subway_lines[:Sline].index start_stop
s_end_index_number = subway_lines[:Sline].index end_stop

case start_line
when "N"
  if n_start_index_number <= 4
    if subway_lines[:Nline].include?(end_stop)
      number_of_stops = subway_lines[:Nline].slice(n_start_index_number..n_end_index_number).count
      which_stops_in_between = subway_lines[:Nline].slice(n_start_index_number..n_end_index_number)
        puts "

There are #{number_of_stops} stops until your destination.  The stops are as follows: #{which_stops_in_between}"
    elsif subway_lines[:Lline].include?(end_stop)
        if l_end_index_number < 2
          number_of_stops = subway_lines[:Nline].slice(n_start_index_number..4).count + subway_lines[:Lline].slice(l_end_index_number..1).reverse.count
          which_stops_in_between = subway_lines[:Nline].slice(n_start_index_number..4) + subway_lines[:Lline].slice(l_end_index_number..1).reverse
            puts "

There are #{number_of_stops} stops until your destination.  The stops are as follows: #{which_stops_in_between}"
        else
          number_of_stops = subway_lines[:Nline].slice(n_start_index_number..4).count + subway_lines[:Lline].slice(3..l_end_index_number).count
          which_stops_in_between = subway_lines[:Nline].slice(n_start_index_number..4) + subway_lines[:Lline].slice(3..l_end_index_number)
            puts "

There are #{number_of_stops} stops until your destination.  The stops are as follows: #{which_stops_in_between}"
        end
    elsif subway_lines[:Sline].include?(end_stop)
        if s_end_index_number < 4
          number_of_stops = subway_lines[:Nline].slice(n_start_index_number..4).count + subway_lines[:Sline].slice(s_end_index_number..3).reverse.count
          which_stops_in_between = subway_lines[:Nline].slice(n_start_index_number..4) + subway_lines[:Sline].slice(s_end_index_number..3).reverse
            puts "

There are #{number_of_stops} stops until your destination.  The stops are as follows: #{which_stops_in_between}"
        else
          number_of_stops = subway_lines[:Nline].slice(n_start_index_number..4).count + subway_lines[:Sline].slice(5..s_end_index_number).count
          which_stops_in_between = subway_lines[:Nline].slice(n_start_index_number..4) + subway_lines[:Sline].slice(5..s_end_index_number)
            puts "

There are #{number_of_stops} stops until your destination.  The stops are as follows: #{which_stops_in_between}"
        end
    else
      puts "I'm sorry, I don't understand."
    end
  elsif n_start_index_number == 5
    if subway_lines[:Nline].include?(end_stop)
      number_of_stops = subway_lines[:Nline].slice(n_end_index_number..n_start_index_number).reverse.count
      which_stops_in_between = subway_lines[:Nline].slice(n_end_index_number..n_start_index_number).reverse
        puts "

There are #{number_of_stops} stops until your destination.  The stops are as follows: #{which_stops_in_between}"
    elsif subway_lines[:Lline].include?(end_stop)
      if l_end_index_number < 2
        number_of_stops = subway_lines[:Nline].slice(4..n_start_index_number).count + subway_lines[:Lline].slice(l_end_index_number..1).reverse.count
        which_stops_in_between = subway_lines[:Nline].slice(4..n_start_index_number).reverse + subway_lines[:Lline].slice(l_end_index_number..1).reverse
          puts "

There are #{number_of_stops} stops until your destination.  The stops are as follows: #{which_stops_in_between}"
      else
        number_of_stops = subway_lines[:Nline].slice(4..n_start_index_number).count + subway_lines[:Lline].slice(3..l_end_index_number).count
        which_stops_in_between = subway_lines[:Nline].slice(4..n_start_index_number).reverse + subway_lines[:Lline].slice(3..l_end_index_number)
          puts "

There are #{number_of_stops} stops until your destination.  The stops are as follows: #{which_stops_in_between}"
      end
    elsif subway_lines[:Sline].include?(end_stop)
      if s_end_index_number < 4
        number_of_stops = subway_lines[:Nline].slice(4..n_start_index_number).count + subway_lines[:Sline].slice(s_end_index_number..3).reverse.count
        which_stops_in_between = subway_lines[:Nline].slice(4..n_start_index_number).reverse + subway_lines[:Sline].slice(s_end_index_number..3).reverse
          puts "

There are #{number_of_stops} stops until your destination.  The stops are as follows: #{which_stops_in_between}"
      else
        number_of_stops = subway_lines[:Nline].slice(4..n_start_index_number).count + subway_lines[:Sline].slice(5..s_end_index_number).count
        which_stops_in_between = subway_lines[:Nline].slice(4..n_start_index_number).reverse + subway_lines[:Sline].slice(5..s_end_index_number)
          puts "

There are #{number_of_stops} stops until your destination.  The stops are as follows: #{which_stops_in_between}"
      end
    else
      puts "I'm sorry, I don't understand."
    end
  else
    puts "I'm sorry, I don't understand."
  end
when "L"
  if l_start_index_number <= 2
    if subway_lines[:Lline].include?(end_stop)
      number_of_stops = subway_lines[:Lline].slice(l_start_index_number..l_end_index_number).count
      which_stops_in_between = subway_lines[:Lline].slice(l_start_index_number..l_end_index_number)
        puts "

There are #{number_of_stops} stops until your destination.  The stops are as follows: #{which_stops_in_between}"
    elsif subway_lines[:Nline].include?(end_stop)
        if n_end_index_number < 4
          number_of_stops = subway_lines[:Lline].slice(l_start_index_number..2).count + subway_lines[:Nline].slice(n_end_index_number..3).reverse.count
          which_stops_in_between = subway_lines[:Lline].slice(l_start_index_number..2) + subway_lines[:Nline].slice(n_end_index_number..3).reverse
            puts "

There are #{number_of_stops} stops until your destination.  The stops are as follows: #{which_stops_in_between}"
        else
          number_of_stops = subway_lines[:Lline].slice(l_start_index_number..2).count + subway_lines[:Nline].slice(5..n_end_index_number).count
          which_stops_in_between = subway_lines[:Lline].slice(l_start_index_number..2) + subway_lines[:Nline].slice(5..n_end_index_number)
            puts "

There are #{number_of_stops} stops until your destination.  The stops are as follows: #{which_stops_in_between}"
        end
    elsif subway_lines[:Sline].include?(end_stop)
        if s_end_index_number < 4
          number_of_stops = subway_lines[:Lline].slice(l_start_index_number..2).count + subway_lines[:Sline].slice(s_end_index_number..3).reverse.count
          which_stops_in_between = subway_lines[:Lline].slice(l_start_index_number..2) + subway_lines[:Sline].slice(s_end_index_number..3).reverse
            puts "

There are #{number_of_stops} stops until your destination.  The stops are as follows: #{which_stops_in_between}"
        else
          number_of_stops = subway_lines[:Lline].slice(l_start_index_number..2).count + subway_lines[:Sline].slice(5..s_end_index_number).count
          which_stops_in_between = subway_lines[:Lline].slice(l_start_index_number..2) + subway_lines[:Sline].slice(5..s_end_index_number)
            puts "

There are #{number_of_stops} stops until your destination.  The stops are as follows: #{which_stops_in_between}"
        end
    else
      puts "I'm sorry, I don't understand."
    end
  elsif l_start_index_number > 2
    if subway_lines[:Lline].include?(end_stop)
      number_of_stops = subway_lines[:Lline].slice(l_end_index_number..l_start_index_number).reverse.count
      which_stops_in_between = subway_lines[:Lline].slice(l_end_index_number..l_start_index_number).reverse
        puts "

There are #{number_of_stops} stops until your destination.  The stops are as follows: #{which_stops_in_between}"
    elsif subway_lines[:Nline].include?(end_stop)
      if n_end_index_number < 4
        number_of_stops = subway_lines[:Lline].slice(2..l_start_index_number).count + subway_lines[:Nline].slice(n_end_index_number..3).reverse.count
        which_stops_in_between = subway_lines[:Lline].slice(2..l_start_index_number).reverse + subway_lines[:Nline].slice(n_end_index_number..3).reverse
          puts "

There are #{number_of_stops} stops until your destination.  The stops are as follows: #{which_stops_in_between}"
      else
        number_of_stops = subway_lines[:Lline].slice(2..l_start_index_number).count + subway_lines[:Nline].slice(5..n_end_index_number).count
        which_stops_in_between = subway_lines[:Lline].slice(2..l_start_index_number).reverse + subway_lines[:Nline].slice(5..n_end_index_number)
          puts "

There are #{number_of_stops} stops until your destination.  The stops are as follows: #{which_stops_in_between}"
      end
    elsif subway_lines[:Sline].include?(end_stop)
      if s_end_index_number < 4
        number_of_stops = subway_lines[:Lline].slice(2..l_start_index_number).count + subway_lines[:Sline].slice(s_end_index_number..3).reverse.count
        which_stops_in_between = subway_lines[:Lline].slice(2..l_start_index_number).reverse + subway_lines[:Sline].slice(s_end_index_number..3).reverse
          puts "

There are #{number_of_stops} stops until your destination.  The stops are as follows: #{which_stops_in_between}"
      else
        number_of_stops = subway_lines[:Lline].slice(2..l_start_index_number).count + subway_lines[:Sline].slice(5..s_end_index_number).count
        which_stops_in_between = subway_lines[:Lline].slice(2..l_start_index_number).reverse + subway_lines[:Sline].slice(5..s_end_index_number)
          puts "

There are #{number_of_stops} stops until your destination.  The stops are as follows: #{which_stops_in_between}"
      end
    else
      puts "I'm sorry, I don't understand."
    end
  else
    puts "I'm sorry, I don't understand."
  end
when "S"
  if s_start_index_number <= 4
    if subway_lines[:Sline].include?(end_stop)
      number_of_stops = subway_lines[:Sline].slice(s_start_index_number..s_end_index_number).count
      which_stops_in_between = subway_lines[:Sline].slice(s_start_index_number..s_end_index_number)
        puts "

There are #{number_of_stops} stops until your destination.  The stops are as follows: #{which_stops_in_between}"
    elsif subway_lines[:Nline].include?(end_stop)
        if n_end_index_number < 4
          number_of_stops = subway_lines[:Sline].slice(s_start_index_number..4).count + subway_lines[:Nline].slice(n_end_index_number..3).reverse.count
          which_stops_in_between = subway_lines[:Sline].slice(s_start_index_number..4) + subway_lines[:Nline].slice(n_end_index_number..3).reverse
            puts "

There are #{number_of_stops} stops until your destination.  The stops are as follows: #{which_stops_in_between}"
        else
          number_of_stops = subway_lines[:Sline].slice(s_start_index_number..4).count + subway_lines[:Nline].slice(5..n_end_index_number).count
          which_stops_in_between = subway_lines[:Sline].slice(s_start_index_number..4) + subway_lines[:Nline].slice(5..n_end_index_number)
            puts "

There are #{number_of_stops} stops until your destination.  The stops are as follows: #{which_stops_in_between}"
        end
    elsif subway_lines[:Lline].include?(end_stop)
        if l_end_index_number < 2
          number_of_stops = subway_lines[:Sline].slice(s_start_index_number..4).count + subway_lines[:Lline].slice(l_end_index_number..1).reverse.count
          which_stops_in_between = subway_lines[:Sline].slice(s_start_index_number..4) + subway_lines[:Lline].slice(l_end_index_number..1).reverse
            puts "

There are #{number_of_stops} stops until your destination.  The stops are as follows: #{which_stops_in_between}"
        else
          number_of_stops = subway_lines[:Sline].slice(s_start_index_number..4).count + subway_lines[:Lline].slice(3..l_end_index_number).count
          which_stops_in_between = subway_lines[:Sline].slice(s_start_index_number..4) + subway_lines[:Lline].slice(3..l_end_index_number)
            puts "

There are #{number_of_stops} stops until your destination.  The stops are as follows: #{which_stops_in_between}"
        end
    else
      puts "I'm sorry, I don't understand."
    end
  elsif s_start_index_number == 5
    if subway_lines[:Sline].include?(end_stop)
      number_of_stops = subway_lines[:Sline].slice(s_end_index_number..s_start_index_number).reverse.count
      which_stops_in_between = subway_lines[:Sline].slice(s_end_index_number..s_start_index_number).reverse
        puts "

There are #{number_of_stops} stops until your destination.  The stops are as follows: #{which_stops_in_between}"
    elsif subway_lines[:Nline].include?(end_stop)
      if n_end_index_number < 4
        number_of_stops = subway_lines[:Sline].slice(4..s_start_index_number).count + subway_lines[:Nline].slice(n_end_index_number..3).reverse.count
        which_stops_in_between = subway_lines[:Sline].slice(4..s_start_index_number).reverse + subway_lines[:Nline].slice(n_end_index_number..3).reverse
          puts "

There are #{number_of_stops} stops until your destination.  The stops are as follows: #{which_stops_in_between}"
      else
        number_of_stops = subway_lines[:Sline].slice(4..s_start_index_number).count + subway_lines[:Nline].slice(5..n_end_index_number).count
        which_stops_in_between = subway_lines[:Sline].slice(4..s_start_index_number).reverse + subway_lines[:Nline].slice(5..n_end_index_number)
          puts "

There are #{number_of_stops} stops until your destination.  The stops are as follows: #{which_stops_in_between}"
      end
    elsif subway_lines[:Lline].include?(end_stop)
      if l_end_index_number < 2
        number_of_stops = subway_lines[:Sline].slice(4..s_start_index_number).count + subway_lines[:Lline].slice(l_end_index_number..1).reverse.count
        which_stops_in_between = subway_lines[:Sline].slice(4..s_start_index_number).reverse + subway_lines[:Lline].slice(l_end_index_number..1).reverse
          puts "

There are #{number_of_stops} stops until your destination.  The stops are as follows: #{which_stops_in_between}"
      else
        number_of_stops = subway_lines[:Sline].slice(4..s_start_index_number).count + subway_lines[:Lline].slice(3..l_end_index_number).count
        which_stops_in_between = subway_lines[:Sline].slice(4..s_start_index_number).reverse + subway_lines[:Lline].slice(3..l_end_index_number)
          puts "

There are #{number_of_stops} stops until your destination.  The stops are as follows: #{which_stops_in_between}"
      end
    else
      puts "I'm sorry, I don't understand."
    end
  else
    puts "I'm sorry, I don't understand."
  end
else
  "I'm sorry, I don't understand."
end






# binding.pry
