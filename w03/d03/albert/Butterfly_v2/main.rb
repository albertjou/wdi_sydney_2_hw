require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_support/all'
require 'active_record'
require 'pg'

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :host => 'localhost',
  :username => 'user',
  :password => '',
  :database => 'butterfly',
  :pool => 20
)

class Butterfly < ActiveRecord::Base
  attr_accessible :name, :photo, :family
  has_many :foods, :dependent => :destroy
end

class Food < ActiveRecord::Base
  attr_accessible :plant, :photo, :season
  belongs_to :butterfly
end

before do
  @nav_rows = Butterfly.uniq.pluck(:family)
end

get '/butterflies/:butterfly_id/edit' do
  @row = Butterfly.find(params[:butterfly_id])
  erb :new
end

post '/butterflies/:butterfly_id' do
  @butterfly = Butterfly.find(params[:butterfly_id])
  redirect to '/'
end

post '/butterflies/:butterfly_id/delete' do
  Butterfly.destroy(params[:butterfly_id])

  redirect to '/butterflies'
end

get '/' do
 redirect to '/butterflies'

end

get '/butterflies/new' do
  erb :new
end


get '/butterflies' do
  @rows = Butterfly.all
  erb :butterflies
end

post '/create' do
  unless temp = Butterfly.find(params[:id])
    temp = Butterfly.create
  end
  temp.update_attributes({
    :name => params[:name],
    :photo => params[:photo],
    :family => params[:family]
  })
  redirect to '/butterflies'
end


get '/butterflies/:butterfly_id/foods' do
  @butterfly = Butterfly.find(params[:butterfly_id])
  erb :foods
end

get '/butterflies/:family' do
  @rows = Butterfly.where("family = ?", params[:family])
  erb :butterflies
end

post '/foods' do
  # binding.pry
  @butterfly = Butterfly.find(params[:id])
  food = Food.new
  food.plant = params[:plant]
  food.photo = params[:photo]
  food.season = params[:season]
  @butterfly.foods << food
  redirect to '/butterflies'
end

get '/pry' do
  binding.pry
end
