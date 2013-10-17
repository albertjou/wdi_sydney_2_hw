# a more robust solution for removing spaces from your URL is to use URI encoding which will also fix other troublesome characters like ? and /
# require 'open-uri'
# url = URI::encode url
# URI::encode 'Oh Brother! Where Art Thou?'
# "Oh%20Brother!%20Where%20Art%20Thou?"


require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'

get '/' do

    #below: params[] is always created when information is retrieved from a form
  if params[:movierequest]
      #below: gets the request from the form
    @title = params[:movierequest].capitalize
       #below: accesses the movie's webpage
    url = "http://omdbapi.com?t=#{@title}"
     movie = HTTParty.get url
     movie_info = JSON movie
      #below: creates instance variables for all the different categories that I want to be displayd.  These instance variables are used in form.erb to display on the page once requested.
     @movieplot = movie_info["Plot"]
     @movieyear = movie_info["Year"]
     @movieruntime = movie_info["Runtime"]
     @moviegenre = movie_info["Genre"]
     @moviedirector = movie_info["Director"]
     @movieactors = movie_info["Actors"]
     @movieposter = movie_info["Poster"]
  else
      #below: presents the page with only the form if a movie has not been requested.  The entire if statement allows the form and movie details to be displayed on the same page allowing a use to request their next movie without leaving the page (hitting the back button)
    @price = nil
  end
    #below: access to form.erb
  erb :form
end



# Nick's code!!!!-------
# get '/' do
#   erb:form
# end

# get '/movies' do
#   @title = params[:movie_name]
#   url = "http://www.omdbapi.com/?i=&t=#{@title}"

#   @movie = HTTParty.get url
#   @movie_info = JSON @movie
#   erb:movies
# end







