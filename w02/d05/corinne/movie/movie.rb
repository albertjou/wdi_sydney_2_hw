# a more robust solution for removing spaces from your URL is to use URI encoding which will also fix other troublesome characters like ? and /
# require 'open-uri'
# url = URI::encode url
# URI::encode 'Oh Brother! Where Art Thou?'
# "Oh%20Brother!%20Where%20Art%20Thou?"
#


require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'

get '/' do

    #below: params[] is always created when information is retrieved from a form  ALSO the gsub method allows a two word movie to be entered
  if params[:movierequest]
      #below: gets the request from the form
    @title = params[:movierequest].gsub(/[' ']/, '%20').capitalize
       #below: accesses the movie's webpage
    url = "http://omdbapi.com?t=#{@title}"

    @movie = HTTParty.get url
    @movie_info = JSON @movie
  else
      #below: presents the page with only the form if a movie has not been requested.  The entire if statement allows the form and movie details to be displayed on the same page allowing a use to request their next movie without leaving the page (hitting the back button)
    @movie_info = nil
  end
    #below: access to form.erb
  erb :form
end









