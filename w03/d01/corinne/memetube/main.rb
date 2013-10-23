require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'pry'

get '/' do
  @videos = query_db('SELECT * FROM videos')
  erb :index
end

get '/movies/genre/:genre' do
  query = "SELECT * FROM videos WHERE genre='#{params[:genre]}'"
  @videos = query_db(query)
  erb :index
end



get '/videos/new' do
  # We're just showing a form here so no need to talk to the database.
  erb :memenew
end

post '/videos/create' do
  # Welcome to SQL quoting hell.

  # Because the 'quotes' around each of our values has a special meaning, we need to
  # 'escape' the quotes within our values by replacing ' with \\' using gsub
  query = "INSERT INTO videos (name, description, embed, genre) VALUES ('#{params[:name].gsub(/'/, "\\'")}', '#{params[:description].gsub(/'/, "\\'")}', '#{params[:embed]}', '#{params[:genre].gsub(/'/, "\\'")}')"
  query_db(query)
  redirect to '/'
end

get '/videos/:id/edit' do
  query = "SELECT * FROM videos WHERE id=#{params[:id]}"
  @video = query_db(query)
  @video = @video.first # Remember, exec() returns a collection, even for 1 item.

  erb :memeedit
end

post '/videos/update' do
  # Once again this will be all ruined by any quotes in the values.
  # Horrible unreadable gsub to the rescue again >: |
  query = "UPDATE videos SET name='#{params[:name].gsub(/'/, "\\'")}', description='#{params[:description].gsub(/'/, "\\'")}', embed='#{params[:embed].gsub(/'/, "\\'")}', genre='#{params[:genre].gsub(/'/, "\\'")}' WHERE id=#{params[:id]}"
  query_db(query)

  redirect to "/videos/#{params[:id]}"
end

get '/videos/:id/delete' do
  # We don't need quotes around the id because it's numeric and that's okay with SQL
  query = "DELETE FROM videos WHERE id=#{params[:id]}"
  query_db(query)
  redirect to '/'
end

get '/videos/:id' do
  # Gross, we are repeating ourselves.
  @video = query_db("SELECT * FROM videos WHERE id=#{params[:id]}")
  @video = @video.first

  if @video.nil?
    redirect to '/'
  end

  erb :memeview
end

def query_db(query)
  connection = PG.connect(:dbname => 'memetube', :host => 'localhost')
  result = connection.exec(query)
  connection.close
  result
end
