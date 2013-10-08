require 'pry'
#include the files containing the classes that the program will use
require_relative 'building'
require_relative 'apartment'
require_relative 'tenant'

#create tenants
tenant1 = Tenant.new
tenant2 = Tenant.new

#setup tenants
tenant1.name = "Mr Rogers"
tenant1.age = 50
tenant1.gender = "male"

tenant2.name = "Mrs Rogers"
tenant2.age = 49
tenant2.gender = "female"

#create apartments
unit101 = Apartment.new

#setup apartments
unit101.price = 300.00
unit101.is_occupied = true
unit101.sqft = 100
unit101.num_beds = 1
unit101.num_baths = 1

#create building
silverstream = Building.new

#setup building
silverstream.address = '1 Somewhere Road, SomwhereVille, SomeCity, 2000'
silverstream.style = 'Contemporary'
silverstream.has_doorman = true
silverstream.is_walkup = false
silverstream.num_floors = 4

#Class linkages
#link the tenant to an instance of the apartment class
tenant1.apartment = unit101
tenant2.apartment = unit101

#link the apartment to array of tenants
unit101.renters.push(tenant1,tenant2)

#Link the building to its apartments
silverstream.apartments << unit101

#The building method automatically calls to_s methods of the nested class objects
puts silverstream.to_s

#binding.pry