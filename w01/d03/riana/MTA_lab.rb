#code to set up hash of lines (keys) that store the array of stops (values) per line
def initializer
  subway ={
    "N Line" => ["Times Square","34th","28th on the N","Union Square","8th on the N"],
    "L Line" => ["8th","6th","Union Square","3rd","1st"],
    "6 Line" => ["Grand Central","33rd","28th","23rd","Union Square","Astor Place"]
  }
  get_route(subway)
end

#get the route information from th euser
def get_route(subway)
  #prompt user to enter their line
  puts "At which line are you boarding the train?"
  display_lines(subway)
  boardingLine = gets.chomp
  #prompt user to enter their stop for the selected line
  puts "At which stop are you boarding the train?"
  display_stops(subway, boardingLine)
  boardingStop = gets.chomp

  #prompt user to enter their line
  puts "At which line are you leaving?"
  display_lines(subway)
  exitLine = gets.chomp
  #prompt user to enter their stop for the selected line
  puts "At which stop are you leaving?"
  display_stops(subway, exitLine)
  exitStop = gets.chomp

  route_details(subway, boardingLine, boardingStop, exitLine, exitStop)
  puts "Happy Travels!"
end
def display_lines(subway)
    subway.each do |key,value|
      puts "#{key}"
    end
    print "> "
end
def display_stops(subway, line)
  subway[line].each do |stop|
    puts stop
  end
  print "> "
end

def route_details(subway, boardingLine, boardingStop, exitLine, exitStop)
  #check if the route changes lines
  if boardingLine == exitLine
    #get the start and end stops on the line
    tripStart = subway[boardingLine].index(boardingStop)
    tripEnd = subway[exitLine].index(exitStop)
    #calculate the number of stops on the route excluding the current stop
    numStops = tripEnd - tripStart
    #display the number of stops on the route
    puts "There will be #{numStops} stops on your route"
    #loop through the stops on the line from the boarding stop to the exit stop and display them
    subway[boardingLine].slice(tripStart+1..tripEnd).each { |stop| puts stop }
  else
    #get the start and end stops before the change over to the new line
    tripStart = subway[boardingLine].index(boardingStop)
    changeOver = subway[boardingLine].index("Union Square")
    #get the start and end stops after the change over to the new line
    changeStart = subway[exitLine].index("Union Square")
    tripEnd = subway[exitLine].index(exitStop)
    #calculate the number of stops on the route
    numStopsBefore = changeOver - tripStart
    numStopsAfter = tripEnd - changeStart
    #display the number of stops before change-over, after change-over and in total on the route
    puts "After #{numStopsBefore} stops change to #{exitLine}.\n There are #{numStopsAfter} stops after Union Square. \n #{numStopsBefore + numStopsAfter} stops in total."
    #loop through the route stops before the change-over and display them
    subway[boardingLine].slice(tripStart..changeOver).each {|stop| puts stop}
    #loop through the route stops after the change-over and display them
    subway[exitLine].slice(changeStart+1..tripEnd).each {|stop| puts stop}
  end
end
initializer
