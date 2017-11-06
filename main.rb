require 'sinatra'
require 'sinatra/activerecord'
require './models'

set :database, "sqlite3:main.sqlite3"
set :sessions, true

def current_user
	if session[:user_id]
		User.find(session[:user_id])
	end
end


get '/' do
	@user = current_user
	@feed = Post.last(10)
  erb :home
end 

get '/sign_in' do
	@user = current_user
	if @user
		redirect '/'
	else
	erb :sign_in
	end
end

get '/create_account' do 
	erb :create_account
end

get '/profile' do
	@user = current_user
	erb :profile
end

get '/profile_posts' do
	erb :profile_posts
end

get '/change_details' do
	erb :change_details
end

get '/post' do
	erb :post
end

get '/find' do
	erb :find
end

get '/found' do

	erb :profile
end

get '/your_post' do
	
	erb :your_post
end

post '/create_account' do
	@user = User.create(params[:user])
	erb :/
end

post '/sign_in' do
	@user = User.find_by(params[:user])
	if @user
		session[:user_id] = @user.id 
		redirect '/'
	else
		redirect '/sign_in'
	end
end

post '/find' do
	@user = User.where(name: params[:name]).first
	erb :found
end

post '/post' do
	
	erb :your_post
end

get '/logout' do
	session[:user_id] = nil
	redirect '/'
end