class Apartment
  attr_accessor :price, :is_occupied, :sqft, :num_beds, :num_baths, :tenants

  def initialize
    @tenants = []
  end

  def price
    @price
  end

  def display
    names = @tenants.each {|x| x.name}
    puts "This apartment, priced at #{@price} is #{@sqft} square feet, has #{@num_beds} beds and #{@num_baths} baths"
    print "and is currently #{@is_occupied? "occupied by #{names}" : "not occupied"}."
  end

end
