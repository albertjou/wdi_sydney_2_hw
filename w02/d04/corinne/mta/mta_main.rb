require 'pry'
require 'sinatra'
require 'sinatra/reloader'


get '/' do

  @origin = params['start']
  @destination = params['end']

  def same_line(first, last)

   first == "Aus" || last == "Aus" || $lines[:"#{first[0,1]}line"] == $lines[:"#{last[0,1]}line"]
  end

  def part_journey(first_stop, last_stop)
    line = $lines[:"#{first_stop[0,1]}line"] || $lines[:"#{last_stop[0,1]}line"]
    first_stop_index = line.index(first_stop)
    last_stop_index = line.index(last_stop)

    if (first_stop_index < last_stop_index)
      origin_stops = line[first_stop_index..last_stop_index]
    else
      origin_stops = line[last_stop_index..first_stop_index].reverse
    end
  end


  $lines = {
    :Nline => ["Nts", "N34", "N28", "N23", "Aus", "N08"],
    :Lline => ["L08", "L06", "Aus", "L03", "L01"],
    :Sline => ["Sgc", "S33", "S28", "S23", "Aus", "Sap"]
  }

  if @origin && @destination

    if same_line(@origin, @destination)
      @journey_array = part_journey(@origin, @destination)
    else
      @journey_array = part_journey(@origin, "Aus")+part_journey("Aus", @destination)
    end

    @journey = @journey_array
  end

  erb :index

end

$names = {:Aus => "Union Square", :Nts => "Times Square (N Line)", :N34 => "34th (N Line)", :N28 => "28th (N Line)", :N23 => "23rd (N Line)", :N08 => "8th (N Line)", :L08 => "8th (L Line)", :L06 => "6th (L Line)", :L03 => "3rd (L Line)", :L01 => "1st (L Line)", :Sgc => "Grand Central (6 Line)", :S33 => "33rd (6 Line)", :S28 => "28th (6 Line)", :S23 => "23rd (6 Line)", :Sap => "Astor Place (6 Line)"}








