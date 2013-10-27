require 'pry'
require 'sinatra'
require 'active_record'
require 'sinatra/reloader'
require 'securerandom'

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :host => 'localhost',
  :username => 'user',
  :password => '',
  :database => 'urls',
  :pool => 20
)

class Url < ActiveRecord::Base
  attr_accessible :orig_url, :short_url, :counter
end

get '/' do
  @urls = Url.all
  erb :layout
end

get '/create' do
  exist = Url.find_by_orig_url(params[:url])
  if !exist
    @new = false
    @new_url = Url.new
    @new_url.orig_url = params[:url]
    hex_generated = SecureRandom.hex(3)
    @new_url.short_url = "#{hex_generated}"
    @new_url.counter = 0
    @new_url.save
    @message = "Short url created"
  else
    @message = "You already have a short url."
  end
  redirect to '/'
end

get '/pry' do
  binding.pry
end

get '/:url' do
  if params[:url] == ""
    link = "/new"
  else
    @new = false
    @new_url = false
    @url = Url.where("short_url = ?", params[:url]).first
    @url.counter += 1
    link = @url.orig_url
  end
  binding.pry
  redirect to "#{link}"
end


# Check for the first letter, if it is 'a', redirect to long url otherwise, show layout and allow people to create a new url shortener
