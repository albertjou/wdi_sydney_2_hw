#Title: HappiTails

###Type:
- Group Homework/Lab

###Time Required:
- 4/5 hours
- overnight

###Prerequisites:
- Ruby
  - Objects/Classes
  - Initializer
  - Accessors
  - gets.chomp
  - Multi-file projects ('require')

###Objectives:
- Practice creating objects

###Activity:
- Students should work on this lab in groups
- Have the students work in groups. There is a spec folder containing tests on
each model they can complete before moving on.

###Explanation
- You are the manager at HappiTails animal shelter. You need to manage your
shelter by storing and manipulating information about clients and animals.
- Consider having the students make git commits as they finish each phase, so
they can see the history

#####Suggested Introduction:
  - Introduce the comprehensive lab's specification
  - Using `animal-prompt.rb` as a starting point
    - have class discuss what should happen in each method
    - leave `animal-prompt.rb` on board while students begin working on their own
  - This specification has been written with TDD in mind.  Use this
  specification to (re)introduce TDD.

###Specification:
#####Object Specs:
- Animal:
  - An animal should have a name.
  - An animal should have an age.
  - An animal should have a gender.
  - An animal should have a species.
  - An animal can have multiple toys.

- Client:
  - A client should have a name.
  - A client should have a number of children.
  - A client should have an age.
  - A client should have a number of pets.

- Shelter:
  - The shelter should display all the clients.
  - The shelter should display all the animals.
  - The shelter should display all the animals.

- Relationships:
  - A client should be able to adopt an animal.
  - A client should be able to put an animal up for adoption

#####Phase 1
- Can create animals and clients

#####Phase 2
- New animals and clients can be added to the shelter

#####Phase 3
- When creating an animal or client, the user is prompted for information like names, gender etc.

#####Phase 4
- At start, the user is prompted with a menu of options:
    - display all animals
    - display all clients
    - create an animal
    - create an client
    - facilitate client adopts an animal
    - facilitate client puts an animal up for adoption
- After selecting from the menu the task the user is prompted through the entire process


## GA Stock Exchange Lab (Weekend Homework)

**Objectives:**

* Build an Ruby program using test-driven development that reviews concepts learned this week.

**Activity:**

Students will create a stock management program using TDD. Use Pivotal Tracker and GitHub. These are the things the program should be able to do:
* Create an account for client (name, balance).
* Every client can create multiple portfolios.
* A client can buy stocks at market rate; these stocks will be added to a portfolio and the purchase amount subtracted from cash. (You cannot go to a negative cash balance).
* A client can sell a stock. The proceeds go into his account.
* List all client portfolios and their values (each portfolio value and sum of portfolio values) and the account balance.
* List all stocks in a portfolio.
* List all clients.

**Note:**

Each time a portfolio balance is calculated, the program needs to go out to the web and get current stock prices.

Show students how to install the yahoofinance gem, and require it in the necessary ruby files. Demonstrate how the gem works for students. For example:

YahooFinance::get_quotes(YahooFinance::StandardQuote, 'AAPL')['AAPL'].lastTrade

=> 453.62
