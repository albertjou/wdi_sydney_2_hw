require_relative 'building'
require_relative 'apartment'
require_relative 'tenant'
require 'pry'

#Test cases

# # Tenants
tenant_one = Tenant.new
tenant_one.name = "ABC"
tenant_one.age = 25
tenant_one.gender = 'M'
tenant_one.apartment = []

# tenant_two.name =
# tenant_two.age =
# tenant_two.gender =
# tenant_two.apartment =

# tenant_three.name =
# tenant_three.age =
# tenant_three.gender =
# tenant_three.apartment =

# tenant_four.name =
# tenant_four.age =
# tenant_four.gender =
# tenant_four.apartment =
# Apartments

# All data ok
apartment_one = Apartment.new
apartment_one.price = 3_000
apartment_one.is_occupied = true
apartment_one.sqft = 123
apartment_one.num_beds = 3
apartment_one.num_baths = 2
apartment_one.tenants = [tenant_one]

# Price is negative
apartment_two = Apartment.new
apartment_two.price = -9_000
apartment_two.is_occupied = true
apartment_two.sqft = 223
apartment_two.num_beds = 4
apartment_two.num_baths = 2
# apartment_two.renters =

# Sqft is negative
apartment_three = Apartment.new
apartment_three.price = 9_000_000
apartment_three.is_occupied = false
apartment_three.sqft = -111
apartment_three.num_beds = 5
apartment_three.num_baths = 1
# apartment_three.renters =

# Number of beds is negative
apartment_four = Apartment.new
apartment_four.price = 600
apartment_four.is_occupied = false
apartment_four.sqft = 500
apartment_four.num_beds = -5
apartment_four.num_baths = 2
# apartment_four.renters =

# Buildings

building_one = Building.new
building_one.address = "123 ABC Street"
building_one.style = "European"
building_one.has_doorman = true
building_one.is_walkup = true
building_one.num_floors = 1
building_one.apartments = [apartment_one]

building_two = Building.new
building_two.address = "1234 ABC Street"
building_two.style = "Italian"
building_two.has_doorman = true
building_two.is_walkup = false
building_two.num_floors = 2
# building_two.apartments =

building_three = Building.new
building_three.address = "12345 ABC Street"
building_three.style = "French"
building_three.has_doorman = false
building_three.is_walkup = true
building_three.num_floors = 3
# building_three.apartments =

building_four = Building.new
building_four.address = "123456 ABC Street"
building_four.style = "German"
building_four.has_doorman = false
building_four.is_walkup = false
building_four.num_floors = 0
# building_four.apartments =



# This gets a list of the buildings
# class << Building
#   def all
#     ObjectSpace.each_object(self).entries
#   end
# end

# class << Apartment
#    def all
#     ObjectSpace.each_object(self).entries
#   end
# end

# class << Tenant
#    def all
#     ObjectSpace.each_object(self).entries
#   end
# end


#This can only be done if each instance is stored as a hash

# def how_many_apartments(*answer)
#   if answer.length == 0
#     puts ""
#   elsif answer.first == "occupied"
#     puts ""
#   else
#     puts ""
# end

binding.pry