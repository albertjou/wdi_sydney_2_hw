require 'pry'
require 'sinatra'
require 'active_record'
require 'sinatra/reloader'

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :host => 'localhost',
  :username => 'user',
  :password => '',
  :database => 'posts',
  :pool => 20
)

class Post < ActiveRecord::Base
  attr_accessible :title, :body, :created_at, :updated_at
  has_many :comments, :dependent => :destroy
end

class Comment < ActiveRecord::Base
  attr_accessible :commentor, :comment, :created_at
  belongs_to :post
end

get '/' do
  @posts = Post.all
  erb :posts
end

get '/new' do
  erb :form
end

get '/:id/edit' do
  @post = Post.find(params[:id])
  erb :form
end

get '/:id/delete' do
  Post.destroy(params[:id])
  redirect to '/'
end

get '/:id/comment' do
  @post = Post.find(params[:id])
  erb :comment
end

get '/:id/:comment_id/edit' do
  @post = Post.find(params[:id])
  @comment = Comment.find(params[:comment_id])
  erb :comment
end

post '/create' do
  unless temp = Post.find_by_id(params[:id])
    temp = Post.new
    temp.created_at = Time.now
  end
  temp.update_attributes({
    :title => params[:title],
    :body => params[:body],
    :updated_at => Time.now
    })
  redirect to '/'
end

get '/pry' do
  binding.pry
end

post '/comment' do
  @post = Post.find(params[:id])
  unless temp = Comment.find_by_id(params[:comment_id])
    temp = Comment.new
    temp.created_at = Time.now
  end
  temp.comment = params[:comment]
  temp.commentor = params[:commentor]
  @post.comments << temp
  redirect to "/#{params[:id]}"
end

get '/:id' do
  @posts = Post.find(params[:id])
  erb :posts
end
