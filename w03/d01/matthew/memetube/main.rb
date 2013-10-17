require 'pry'
require 'sinatra'
require 'pg'
require 'sinatra/reloader'

get '/' do
  connection = PG.connect(:dbname => 'memetube', :host => 'localhost')
  @videos = connection.exec('SELECT * FROM videos')

  erb :index
end


get '/videos/new' do

  erb :memenew
end

post '/videos/create' do
  query = "INSERT INTO videos (name, description, embed, genre) VALUES ('#{params[:name].gsub(/'/, "\\'")}', '#{params[:description].gsub(/'/, "\\'")}', '#{params[:embed]}', '#{params[:genre].gsub(/'/, "\\'")}');"
  connection = PG.connect(:dbname => 'memetube', :host => 'localhost')
  connection.exec(query)
  connection.close
  redirect to '/'
end


get '/videos/:id/edit' do
  query = "SELECT * FROM videos WHERE id=#{params[:id]}"
  connection = PG.connect(:dbname => 'memetube', :host => 'localhost')
  @video = connection.exec(query)
  @video = @video.first
  connection.close

  erb :memeedit
end

post '/videos/update' do
  query = "UPDATE videos SET name='#{params[:name].gsub(/'/, "\\'")}', description='#{params[:description].gsub(/'/, "\\'")}', embed='#{params[:embed]}', genre='#{params[:genre]}' WHERE id=#{params[:id]};"
  connection = PG.connect(:dbname => 'memetube', :host => 'localhost')
  connection.exec(query)
  connection.close

  redirect to "/videos/#{params[:id]}"
end



# get '/videos/search/:genre' do
#   query = "SELECT * FROM videos WHERE genre=#{params[:genre]}"
#   connection = PG.connect(:dbname => 'memetube', :host => 'localhost')
#   connection.exec(query)
#   connection.close

#   erb :genreselect

# end



get '/videos/:id/delete' do
  query = "DELETE FROM videos WHERE id=#{params[:id]}"
  connection = PG.connect(:dbname => 'memetube', :host => 'localhost')
  connection.exec(query)
  connection.close
  redirect to '/'
end


get '/videos/:id' do
  connection = PG.connect(:dbname => 'memetube', :host => 'localhost')
  @video = connection.exec("SELECT * FROM videos WHERE id=#{params[:id]}")
  connection.close
  @video = @video.first

  if @video.nil?
    redirect to '/'
  end

  erb :memeview
end




