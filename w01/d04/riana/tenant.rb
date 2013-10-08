class Tenant
  attr_accessor :name, :age, :gender, :apartment
  def initialize
    @name = "Mr Tenant"
    @age = 21
    @gender = "male"
  end

  def to_s
     "#{@name} a #{@age} year old #{@gender}"
  end
end