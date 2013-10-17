require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'


before do
  sql = "SELECT DISTINCT family FROM butterflies"
  @nav_rows = query_sql(sql)
end








get '/' do
  @row = query_sql('SELECT * FROM butterflies')

  erb :home
end


get '/butterflies/new' do

  erb :new
end


post '/create' do
  query = "INSERT INTO butterflies (name, latin, family, picture) VALUES ('#{params[:name]}', '#{params[:latin]}', '#{params[:family]}', '#{params[:picture]}')"
  query_sql(query)

  redirect to '/'
end


get '/butterflies/:id/edit/' do
  query = "SELECT * FROM butterflies WHERE id=#{params[:id]}"
  connection = PG.connect(:dbname => 'butterflies', :host => 'localhost')
  @row = connection.exec(query)
  @row = @row.first
  connection.close

  erb :butterfliesedit
end

post '/update' do
  query = "UPDATE butterflies SET name='#{params[:name]}', latin='#{params[:latin]}', family='#{params[:family]}', picture='#{params[:picture]}' WHERE id=#{params[:id]};"
  query_sql(query)

  redirect to "/butterflies/#{params[:id]}"

end


get '/butterflies/:id' do
  connection = PG.connect(:dbname => 'butterflies', :host => 'localhost')
  @rows = connection.exec("SELECT * FROM butterflies WHERE id=#{params[:id]}")
  connection.close
  @row = @rows.first

  if @row.nil?
    redirect to '/'
  end

  erb :butterflies
end


post '/butterflies/:id/delete' do
  query = "DELETE FROM butterflies WHERE id=#{params[:id]}"
  query_sql(query)

  redirect to '/'
end



get '/butterflies/family/:family' do
  query = "SELECT * FROM butterflies WHERE family='#{params[:family]}'"
  @rows = query_sql(query)

  erb :families

end






def query_sql(sql)
  connection = PG.connect(:dbname => 'butterflies', :host => 'localhost')
  result = connection.exec(sql)
  connection.close
  result
end
