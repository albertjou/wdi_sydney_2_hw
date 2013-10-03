class Tenant
  attr_accessor :name, :age, :gender, :apartment

  def name
    @name
  end

  def display
    puts "This tenant, #{@name} is a #{@age} year old #{@gender} and #{(@apartment.nil?)? "we have no data on where they are staying" : "stays in one of our apartments"}"
  end

end
