require 'json'
require 'httparty'
require 'sinatra'
require 'sinatra/reloader'
# require 'pry'

get '/' do
  if @title =! nil
    @title = params[:title].to_s.gsub(" ","%20")
    url = "http://omdbapi.com/?t=#{@title}"
    movie = HTTParty.get url
    movie = JSON movie
    @year = movie["Year"]
    @rated = movie["Rated"]
    @released = movie["Released"]
    @runtime = movie["Runtime"]
    @genre = movie["Genre"]
    @director = movie["Director"]
    @writer = movie["Writer"]
    @actors = movie["Actors"]
    @poster = movie["Poster"]
    @plot = movie["Plot"]
    @rating = movie["imdbRating"]
    @votes = movie["imdbVotes"]
  end
  erb :form
end

# binding.pry