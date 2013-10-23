require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_support/all'
require 'pg'

before do
  sql = "SELECT DISTINCT family FROM butterflies"
  @nav_rows = query_db(sql)
end


get '/' do
  # string to store SQL query for all butterflies
  @rows = query_db('SELECT * FROM butterflies')
  # @rows to store the result of SQL query
  @row = @rows.first
  # render butterflies erb
  erb :butterflies
end


get '/butterflies/new' do
  erb :new
end


get '/butterflies' do
  # string to store SQL query for all butterflies
  @rows = query_db('SELECT * FROM butterflies')
  # @rows to store the result of SQL query
  @row = @rows.first
  # render butterflies erb DONT NEED IT
  erb :butterflies
end


post '/create' do
  # string of SQL that will write to db
  query = "INSERT INTO butterflies (name, photo, family) VALUES ('#{params[:name].gsub(/'/, "\\'")}', '#{params[:photo]}', '#{params[:family].gsub(/'/, "\\'")}')"
  # write to db
  query_db(query)
  # back to /butterflies
  redirect to '/'
end


get '/butterflies/:butterfly_id/edit/' do
  # string to store SQL to find a butterfly
  query = "SELECT * FROM butterflies WHERE id=#{params[:butterfly_id]}"
  # execute the SQL
  @rows = query_db(query)
  # @row to store the result of SQL query
  @row = @rows.first

  # render new erb
  erb :new
end


post '/butterflies/:butterfly_id' do
  query = "UPDATE butterflies SET name='#{params[:name].gsub(/'/, "\\'")}', photo='#{params[:photo].gsub(/'/, "\\'")}', family='#{params[:family].gsub(/'/, "\\'")}' WHERE id=#{params[:butterfly_id]}"
  query_db(query)

  redirect to '/'
end


post '/butterflies/:butterfly_id/delete' do
  # string to store SQL to delete a butterfly
  query = "DELETE FROM butterflies WHERE id=#{params[:butterfly_id]}"
  # execute the SQL
  query_db(query)
  # go back to /butterflies
  redirect to '/'
end


get '/butterflies/:butterfly_id' do
  # string to store SQL to update a butterfly
  query = "SELECT * FROM butterflies WHERE id=#{params[:butterfly_id]}"
  # execute the SQL
  @row = query_db(query)
  @butterflies = @row.first

  # go back to /butterflies
  if @row.nil?
    redirect to '/'
  end
  erb :butterflies
end


get '/butterflies/family/:family' do
  # string to store SQL query for a given family
  query = "SELECT * FROM butterflies WHERE family='#{params[:family]}'"
  # @rows to store the result of SQL query
  @rows = query_db(query)
  # families erb
  erb :butterflies
end


def query_db(query)
  # connect to butterfliesdb
  connection = PG.connect(:dbname => 'butterflies', :host => 'localhost')
  # execute the SQL in the argument
  result = connection.exec(query)
  # close db connection
  connection.close
  # return the result of SQL query
  result
end






