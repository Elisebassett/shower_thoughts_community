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
	if @user
		erb :profile	
	else
		redirect '/'
	end
end

get '/change_details' do
	@user = current_user
	if @user
		erb :change_details
	else
		redirect '/'
	end
end

get '/post' do
	@user = current_user
	@bio = @user.bio
	if @user
		erb :post
	else
		redirect '/'
	end	
end

get '/find' do
	erb :find
end

get '/profile/:id' do
	@user = User.find(p[:id])
	erb :profile
end

get '/your_post' do
	
	erb :your_post
end

post '/create_account' do
	@user = User.create(params[:user])
	erb :sign_in
end

post '/change_details' do
	@user = current_user
	@user.update(params[:user])
	redirect '/profile'
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
	@search_term = "%#{params[:name]}%"
	@results = User.where("name LIKE ?", @search_term)
	erb :find
end

post '/post' do
	
	erb :your_post
end

get '/logout' do
	session[:user_id] = nil
	redirect '/'
end