require 'pry'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :host => 'localhost',
  :username => 'user',
  :password => '',
  :database => 'artists',
  :pool => 20
  )


class Artist < ActiveRecord::Base
  attr_accessible :name, :dob, :image, :dod, :nationality
  has_many :artworks
end

class Artwork < ActiveRecord::Base
  attr_accessible :name, :image, :year, :price
  belongs_to :artist
end

# Get a list of artists/artworks
before do
  @artists = Artist.all
  @artworks = Artwork.all
end

# Homepage displays two columns -> artists and artworks images in circles
get '/' do
  erb :start
end

# -----------------Section on artist CRUD------------

#Display all artists
get '/artist' do
  erb :artist
end

#Create artist (TO DO: populate a list of unclaimed artworks)
get '/artist/new' do
  erb :artform
end

#Display specific artist
get '/artist/:artist_id' do
  @artist = Artist.find(params[:artist_id])
  erb :artist
end

#Edit artist (gets artist id and passes it to the artist form)
get '/artist/:artist_id/edit' do
  @artist = Artist.find(params[:artist_id])
  erb :artform
end

#Delete artist
get '/artist/:artist_id/delete' do
  Artist.destroy(params[:artist_id])
  redirect '/artist'
end

post '/artistcreation' do
  unless temp_artist = Artist.find(params[:id])
    temp_artist = Artist.create
  end
  temp_artist.name = params[:name]
  temp_artist.dob = params[:dob]
  temp_artist.dod = params[:dod]
  temp_artist.image = params[:image]
  temp_artist.nationality = params[:nationality]
  temp_artist.save
  redirect '/artist'
end
# -----------------Section on artwork CRUD------------

#Display all artworks
get '/artwork' do
  erb :artwork
end

#Create artwork (TO DO: populate a list of unclaimed artworks)
get '/artwork/new' do
  erb :workform
end

#Display specific artwork
get '/artwork/:artwork_id' do
  @artwork = Artwork.find(params[:artwork_id])
  erb :artwork
end

#Edit artwork (gets artwork id and passes it to the artwork form)
get '/artwork/:artwork_id/edit' do
  @artwork = Artwork.find(params[:artwork_id])
  erb :workform
end

#Delete artwork
get '/artwork/:artwork_id/delete' do
  Artwork.destroy(params[:artwork_id])
  redirect '/artwork'
end

post '/artworkcreation' do
  unless temp_artwork = Artwork.find(params[:id])
    temp_artwork = Artwork.create
  end
  temp_artwork.name = params[:name]
  temp_artwork.year = params[:year]
  temp_artwork.price = params[:price]
  temp_artwork.image = params[:image]
  if params[:artist] = ""
    temp_artwork.artist = nil
  else
    temp_artwork.artist = params[:artist]
  end
  temp_artwork.save
  binding.pry
  redirect '/artwork'
end

# ---------- PRY -----------

get '/pry' do
  binding.pry
end
