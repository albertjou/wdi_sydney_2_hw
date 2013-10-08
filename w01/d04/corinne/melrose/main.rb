require 'pry'

require_relative 'building'
require_relative 'apartment'
require_relative 'tenant'

#Building 1
melrose_place = Building.new
melrose_place.address = '1 Melrose Place'
melrose_place.style = "Art Nouveaux"
melrose_place.has_doorman = false
melrose_place.is_walkup = true
melrose_place.num_floors = 8
# melrose_place.apartment << apartment_1

oceanside = Building.new
oceanside.address = '293 Beach Place'
oceanside.style = 'Colonial'
oceanside.has_doorman = true
oceanside.is_walkup = false
# oceanside.apartment << unit1
# oceanside.apartment << unit2


#Apartment 1
apartment_1 = Apartment.new
apartment_1.price = "$425k"
apartment_1.is_occupied = false
apartment_1.sqft = 900
apartment_1.num_beds = 1
apartment_1.num_baths = 1
apartment_1.person = 0

apartment_2 = Apartment.new
apartment_2.price = '$475K'
apartment_2.is_occupied = true
apartment_2.sqft = 1300
apartment_2.num_beds = 2
apartment_2.num_baths = 1
apartment_2.person = 2

unit1 = Apartment.new
unit1.price = '$780K'
unit1.is_occupied = true
unit1.sqft = 15000
unit1.num_beds = 4
unit1.num_baths = 3
unit1.person = 4

unit2 = Apartment.new
unit2.price = '$1.2M'
unit2.is_occupied = true
unit2.sqft = 20000
unit2.num_beds = 5
unit2.num_baths = 7
unit2.person = 1


#Tenant

judy = Tenant.new
judy.name = "Judy Jenkins"
judy.age = 56
judy.gender = "female"
# judy.apartment << apartment_2

otley = Tenant.new
otley.name = "Otley Jenkins"
otley.age = 62
otley.gender = "male"
# otley.apartment << apartment_2

vanderwoodsenbilt = Tenant.new
vanderwoodsenbilt.name = "Vanderwoodsenbilt Vanderlingsling"
vanderwoodsenbilt.age = 99
vanderwoodsenbilt.gender = "male"
# vanderwoodsenbilt.apartment << unit2

alice = Tenant.new
alice.name = 'Alice Jenkins'
alice.age = 38
alice.gender = 'female'
# alice.apartment << unit1

john = Tenant.new
john.name = 'John Jenkins'
john.age = 43
john.gender = 'male'
# john.apartment << unit1

greg = Tenant.new
greg.name = 'Greg Jenkins'
greg.age = 13
greg.gender = 'male'
# greg.apartment << unit1

betty = Tenant.new
betty.name = 'Betty Jenkins'
betty.age = 9
betty.gender = 'female'
# betty.apartment << unit1





binding.pry