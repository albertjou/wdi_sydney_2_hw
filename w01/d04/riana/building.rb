class Building
attr_accessor :address, :style, :has_doorman, :is_walkup, :num_floors, :apartments
  def initialize
    @address = "1 StreetName Street, Suburb, City, PostCode"
    @style = "Bauhaus"
    @has_doorman = false
    @is_walkup = false
    @num_floors = 1
    @apartments = []
  end

  def to_s
   "#{@address} is a trendy #{@style} #{@num_floor} building consisting of apartments: \n#{@apartments}"
  end
end


=begin
melrose_place = Building.new
unit15 = Apartment.new
melrose_place.apartments << unit15
melrose_place
melrose_place.apartments
=end