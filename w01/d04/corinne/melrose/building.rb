
class Building
  attr_accessor :address, :style, :has_doorman, :is_walkup, :num_floors, :apartment

  def initialize
    @apartment = []

  end
  def to_s()
    puts "The building situated at #{address}, has #{num_floors} floors and is in the style of #{style}."
  end
end
