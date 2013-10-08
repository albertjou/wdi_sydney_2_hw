
puts "Choose the line for the station on which you are starting from?
lines:
[N] = Times Square, 34th, 28th, 23rd, Union Square, 8th,
[L] = 8th, 6th, Union Square, 3rd, 1st
[Six] = Grand Central, 33rd, 28th, 23rd, Union Square, Astor Place"
  line_origin = gets.chomp.upcase



puts "Which station are you travelling from?"
  origin = gets.chomp.downcase
puts "Which line is your destination on?"
  line_destination = gets.chomp.upcase
puts "Which station are you travelling to?"
  destination = gets.chomp.downcase
puts "Youre traveling from #{ origin } on line #{line_origin}, to #{ destination } ons line #{line_destination}"


lines = {
  :N => ["times square", "34th", "28th", "23rd", "union square", "8th"],
  :L => ["8th", "6th", "union square", "3rd", "1st"],
  :SIX => ["grand central", "33rd", "28th", "23rd", "union square", "astor place"]
      }

if (line_origin == line_destination)
  case line_origin
    when "N"
      origin_station = lines[:N].index(origin).to_i #0

      destination_station = lines[:N].index(destination).to_i #3

      if (origin_station > destination_station)
        index_one = lines[:N].reverse.index(origin)
        index_two = lines[:N].reverse.index(destination)

        puts lines[:N].reverse[index_one..index_two]

      else
        puts lines[:N][origin_station.to_i..destination_station.to_i]
      end


    when "L"
      origin_station = lines[:L].index(origin).to_i

      destination_station = lines[:L].index(destination).to_i

      if (origin_station > destination_station)
        index_one = lines[:L].reverse.index(origin)
        index_two = lines[:L].reverse.index(destination)

        puts lines[:L].reverse[index_one..index_two]

      else
        puts lines[:L][origin_station.to_i..destination_station.to_i]
      end

    when "SIX"
      origin_station = lines[:SIX].index(origin).to_i

      destination_station = lines[:SIX].index(destination).to_i

      if (origin_station > destination_station)
        index_one = lines[:SIX].reverse.index(origin)
        index_two = lines[:SIX].reverse.index(destination)

        puts lines[:SIX].reverse[index_one..index_two]

      else
        puts lines[:SIX][origin_station.to_i..destination_station.to_i]
      end
  end
else
  puts "destination line is different to origin line"
  #get symbol

  origin_index = lines[line_origin.to_sym].index(origin).to_i
  origin_intersect_index = lines[line_origin.to_sym].index("union square").to_i
  origin_stops = nil

  if(origin_index > origin_intersect_index)
    origin_stops = lines[line_origin.to_sym][origin_intersect_index..origin_index].reverse
  else
    origin_stops = lines[line_origin.to_sym][origin_index..origin_intersect_index]
  end

  destination_index = lines[line_destination.to_sym].index(destination).to_i
  destination_intersect_index = lines[line_destination.to_sym].index("union square").to_i

  destination_stops = nil
  if (destination_index > destination_intersect_index)
      destination_stops = lines[line_destination.to_sym][destination_intersect_index..destination_index]
  else
      destination_stops = lines[line_destination.to_sym][destination_index..destination_intersect_index].reverse
  end


  puts "Your stops are:"
  puts origin_stops
  puts "-- Change to line #{line_destination} at Union Square "
  puts destination_stops
  puts "** You have arrived at your destination! **"
end