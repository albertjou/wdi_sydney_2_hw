# Warm up excercise 

## Leap year

Write a program that will take a year and report if it is a leap year. The tricky thing here is that a leap year occurs:

```plain
on every year that is evenly divisible by 4
except every year that is evenly divisible by 100
except every year that is evenly divisible by 400.
```

For example, 1997 is not a leap year, but 1996 is.
1900 is not a leap year, but 2000 is.

Your program should be called as follows:

```ruby
year = Year.new(1996)
year.leap?

or

Year.new(1996).leap?
```

## Notes

For a delightful, four minute explanation of the whole leap year phenomenon, go watch [this youtube video](http://www.youtube.com/watch?v=xX96xng7sAE) (later!).

## Source
[JavaRanch Cattle Drive, exercise 3](http://www.javaranch.com/leap.jsp)

# Homework

## Title: Rental App

###Time Required: 
- 2 hours+

###Prerequisites:
- Ruby
- Hashes & Arrays
- Blocks
- OOP
- Multi-file project (require_relative)

###Objectives:
- Practice creating and initializing objects

###Activity:
As a class, you will be creating an app that models the rental process. The premise is that "Owners of buildings can rent apartments to potential tenants". This app should be created using a code-along style.

* Ask students "What types of objects might you have in an app that manages rentals?"
  * Settle on a list that includes building, person, and apartment
* Ask students "What types of things will each of these do (verbs)? Or what will define them (nouns)? And what type will each be?"

|Building - attribute|type|
|:----------|:-----------|
|address|string|
|style|string|
|has_doorman|boolean|
|is_walkup|boolean|
|num_floors|integer|
|apartments|array of apartment objects|

|Apartment - attribute|type|
|:----------|:-----------|
|price|decimal|
|is_occupied|boolean|
|sqft|integer|
|num_beds|integer|
|num_baths|integer|
|renters|array of person objects|

|Person (assume tenants or prospective tenants)|type|
|:----------|:-----------|
|name|string|
|age|integer|
|gender|string|
|apartment|apartment object|

* Write attr_accessors for each object
* Write initialize methods for each object
* Write to_s methods for each object
* Write a main.rb file that allows you to build and add new objects

###Explanation
- This is a multi-file project that has a main file for working with the objects, and each class as separate files.  Students are expected to build this from ground-up, and perhaps starting with the main.rb file.
