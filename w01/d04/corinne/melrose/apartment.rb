class Apartment
  attr_accessor :price, :is_occupied, :sqft, :num_beds, :num_baths, :person

  def initialize
    @person = []
  end

  def to_s
    puts "This apartment has #{num_beds} bedrooms, #{num_baths} bathrooms and is #{sqft} square feet."
  end
end
