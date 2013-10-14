require 'json'
require 'httparty'
require 'sinatra'
require 'sinatra/reloader'
# require 'pry'

# Movies2 Lab

# Objectives:

# Practice creating a multi-page app with Sinatra
# Activity:

# Extend your Movies app to keep a record of searched movies in a file called movies.csv.
# Create an index page that links to each individual movie page
# Create pages for each movie, showing title, year of release, box office revenue and director
# Create a "new movie" page, which will append information about additional movies to the movies.csv file
# Provide a navigation menu for people to navigate around the site, with links back to home and an about page
# Watch out! Our data is comma separated. How will you handle commas occuring in the actual movie data?
# No Javascript please

get '/' do
  if @title =! nil
    @title = params[:title].to_s.gsub(" ","+")
    url = "http://omdbapi.com/?t=#{@title}"
    movie = HTTParty.get url
    @database = open_file
    @list = @database.uniq.compact.map {|hash| hash["Title"]}
    @movie = JSON movie
    if !@list.include?@movie["Title"]
    # Saving to database.txt
        f = File.new('database.csv','a+')
        f.puts(movie)
        f.close
    end
end
erb :form
end


get '/*' do
    @details = params[:splat].first.gsub("+"," ")
    @database = open_file
    @list = @database.uniq.compact.map {|hash| hash["Title"]}
    number = @list.index(@details)
    @movie = @database.uniq.compact[number]
    erb :form

end


def open_file
    @database = []
    f = File.open('database.csv')
    f.each do |line|
        @database << JSON.parse(line.chomp)
    end
    f.close
    @database
end