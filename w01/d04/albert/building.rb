class Building
attr_accessor :address, :style, :has_doorman, :is_walkup, :num_floors, :apartments


def initialize
  @apartments = []
end

def display
  prices = @apartments.each {|x| x.price}

  puts "This building, located on #{@address} is in the #{@style} style.\nIt #{@has_doorman? "has" : "doesn't have"} a doorman, #{@is_walkup? "is" : "is not"} a walk up and is #{@num_floors>0? "#{@num_floors}" : "an unknown number"} #{@num_floors > 1? "storeys" : "storey"}.\nThe apartments within are priced at: #{prices}"
end


end
