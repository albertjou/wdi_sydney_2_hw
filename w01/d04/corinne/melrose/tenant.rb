class Tenant
  attr_accessor :name, :age, :gender, :apartment

  def to_s
    puts "#{name} is #{age} and lives in #{apartment}"
  end
end
