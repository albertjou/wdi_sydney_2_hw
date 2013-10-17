require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_support/all'
require 'pg'

before do
  sql = "SELECT DISTINCT family FROM butterflies"
  @nav_rows = query_sql(sql)
end

get '/butterflies/:butterfly_id/edit/' do
  sql = "SELECT * FROM butterflies WHERE id=#{params[:butterfly_id]}"
  @row = query_sql(sql).first
  erb :new
end

post '/butterflies/:butterfly_id' do
  sql = "SELECT * FROM butterflies WHERE id=#{params[:butterfly_id]}"
  @butterfly = query_sql(sql)
  redirect to '/'
end

post '/butterflies/:butterfly_id/delete' do
  sql = "DELETE FROM butterflies WHERE id=#{params[:id]}"
  query_sql(sql)
  redirect to '/butterflies'
end

get '/' do
 redirect to '/butterflies'

end

get '/butterflies/new' do
  erb :new
end

get '/butterflies/:family' do
  sql = "SELECT * FROM butterflies WHERE family='#{params[:family]}'"
  @rows = query_sql(sql)
  erb :butterflies
end

get '/butterflies' do
  sql = "SELECT * FROM butterflies"
  @rows = query_sql(sql)
  erb :butterflies
end

post '/create' do
  if params[:id] == ""
    query = "INSERT INTO butterflies (name, photo, family) VALUES ('#{params[:name]}', '#{params[:photo]}', '#{params[:family]}')"
  else
    query = "UPDATE butterflies SET family='#{params[:family]}' WHERE id=#{params[:id]}"
  end
  # binding.pry
  query_sql(query)
  redirect to '/butterflies'
end

def query_sql(sql)
  connection = PG.connect(:dbname => 'butterfly', :host => 'localhost')
  result = connection.exec(sql)
  connection.close
  result
end
