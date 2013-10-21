require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_support/all'
require 'pg'

before do
  sql = "SELECT DISTINCT family FROM butterflies"
  @nav_rows = query_db(sql)
end

get '/butterflies/:butterfly_id/edit/' do
  # string to store SQL to find a butterfly
  # execute the SQL
  # @row to store the result of SQL query
  # render new erb
end

post '/butterflies/:butterfly_id' do
  # string to store SQL to update a butterfly
  # execute the SQL
  # go back to /butterflies
end

post '/butterflies/:butterfly_id/delete' do
  # string to store SQL to delete a butterfly
  # execute the SQL
  # go back to /butterflies
end

get '/butterflies/:family' do
  # string to store SQL query for a given family
  # @rows to store the result of SQL query
  # families erb
end

get '/' do
  # home erb
end

get '/butterflies/new' do
  # new erb
end

get '/butterflies' do
  # string to store SQL query for all butterflies
  # @rows to store the result of SQL query
  # render butterflies erb
end

post '/create' do
  # string of SQL that will write to db
  # write to db
  # back to /butterflies
end

def query_sql(sql)
  # connect to butterfliesdb
  # execute the SQL in the argument
  # close db connection
  # return the result of SQL query
end
