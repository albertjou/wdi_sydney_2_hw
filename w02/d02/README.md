### Movies
* Name: Movies App
* Lesson Type: Lab
* Estimated Time: 2 hours
* Original Source: [Chyld Medford](https://github.com/chyld/sinatra/tree/master/2013-02-06-movies)

###Summary

This app should give students practice using a form. They will retreive JSON information using the OMDb API.

#Prerequisites:
- Ruby
- Sinatra
- ERB
- HTML Forms
- active_support
- HTTParty
- JSON

#How to run this activity
Have the students create a Sinatra app that renders a basic form with a text
input. Make sure students understand the form action and method. You may have to
walk through how to use the open movie database API and how to store it in a
hash. From there, students should work on rendering all of the information on
the page. Once they finish that, they can work on styling the page how they
like.

##Objectives
Students should be able to create dynamic routes, create forms with get
requests, render layouts with erb. They will also use active_support to check
the presence of items, and httparty and json to get the movie information.

##Additional Resources
[Dynamic URLs in Sinatra](http://blog.teamtreehouse.com/ruby-sinatra-dynamic-urls-tutorial)
[Open movie database API](http://www.omdbapi.com/)
[HTTParty Tutorial](http://blog.teamtreehouse.com/its-time-to-httparty)
