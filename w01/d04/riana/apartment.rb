class Apartment
  attr_accessor :price, :is_occupied, :sqft, :num_beds, :num_baths, :renters
  def initialize
    @price = 250.00
    @is_occupied = false
    @sqft = 500
    @num_beds = 1
    @num_baths = 1
    @renters = []
  end

  def to_s
     "The apartment costs $#{@price} per week is #{@sqft}m^2 with #{@num_beds} bedroom(s) and #{@num_baths} bathroom(s). Occupied by: \n#{@renters}"
  end
end