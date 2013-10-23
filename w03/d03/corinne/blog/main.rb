require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_support/all'
require 'pg'
require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => 'corinne2', #your postgres.app username
  :password => '',
  :database => "blogs",
  :pool => 20
)

class Post <ActiveRecord::Base
  attr_accessible :title, :body
  has_many :comments
  def body
    attributes['body'].gsub("\n", "<br>")
  end
end

class Comment < ActiveRecord::Base
  attr_accessible :name, :comment
  belongs_to :post
end

# get '/pry' do
#   binding.pry
# end


# ------ Main ------

get '/' do
  @posts = Post.all
  erb :posts
end

get '/posts' do
  @posts = Post.all
  erb :posts
end


# ------ Post New ------

get '/posts/new' do
  erb :new
end

post '/create' do
  post = Post.new
  post.title = params[:title]
  post.body = params[:body]
  post.save
  redirect to '/'
end


# ------ Comment New ------

get '/posts/:id/comments/new' do
  erb :comment_new
end

post '/posts/:id/comments/create' do
  comment = Comment.new
  comment.name = params[:name]
  comment.comment = params[:comment]
  post = Post.find params[:id]
  post.comments << comment
  redirect to "/posts/#{params['id']}"
end



# ------ Post Edit ------


get '/posts/:id/edit/' do
  @post = Post.find(params[:id])
  erb :new
end


post '/posts/:id' do
  post = Post.find(params[:id])
  post.title = params[:title]
  post.body = params[:body]
  post.save
  redirect to '/'
end


# ------ Comment Edit ------

get '/posts/:id/comments/:comment_id/edit/' do
  @comment = Comment.find(params[:comment_id])
  erb :comment_new
end


post '/posts/:id/comments/:comment_id/update/' do
  comment = Comment.find(params[:comment_id])
  comment.title = params[:title]
  comment.body = params[:body]
  comment.save
  redirect to "/posts/#{params['id']}"
end



# ------ Post Delete ------

post '/posts/:id/delete' do
  Post.destroy(params[:id])
  redirect to '/'
end


# ------ Comment Delete ------

post '/posts/:id/comments/:comment_id/delete' do
  Comment.destroy(params[:comment_id])
  redirect to "/posts/#{params['id']}"
end


# ------ Other ------

get '/posts/:id' do
  @posts = Post.where(:id => params[:id])
  if @posts.nil?
    redirect to '/'
  end
  erb :single_post
end


