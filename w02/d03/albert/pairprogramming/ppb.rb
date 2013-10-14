require 'pry'
require 'sinatra'
require 'sinatra/reloader'


get '/' do
  @answer = "Do you have a test for that?"
  @yes = "/pass"
  @no = "/write_test"
    erb :formpass
end

get '/pass' do
  @answer = "Does the test pass?"
  @yes = "/refactor"
  @no = "/write_code"
  erb :formpass
end

get '/refactor' do
  @answer = "Need to refactor?"
  @yes = '/do_refactor'
  @no = 'new_feature'
  erb :formpass
end

get '/do_refactor' do
  @answer = "Refactor the code"
  @done = "/pass"
  erb :formfail
end

get '/write_test' do
  @answer = "write a test"
  @done = "/pass"
  erb :formfail
end

get '/write_code' do
  @answer = "write just enough code for the test to pass."
  @done = "/pass"
  erb :formfail
end

get '/new_feature' do
  @answer = "Select a new feature to implement"
  @done = "/"
end