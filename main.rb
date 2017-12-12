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

post '/sign_in' do
	@user = User.find_by(params[:user])
	if @user
		session[:user_id] = @user.id 
		redirect '/'
	else
		redirect '/sign_in'
	end
end

get '/create_account' do 
	erb :create_account
end

post '/create_account' do
	@user = User.create(params[:user])
	erb :sign_in
end

get '/profile' do
	@user = current_user
	@current_user = current_user
	@posts = @user.posts.reverse_order
	if @user
		erb :profile	
	else
		redirect '/'
	end
end

post '/edit_post/:id' do
	@post = Post.find(params[:id])
	p @post
	@post.update(params[:post])
	redirect '/'
end

get '/profile/:id' do
	@current_user = current_user
	@user = User.find(params[:id])
	@posts = @user.posts.reverse_order
	erb :profile
end

get '/change_details' do
	@user = current_user
	if @user
		erb :change_details
	else
		redirect '/'
	end
end

post '/change_details' do
	@user = current_user
	@user.update(params[:user])
	redirect '/profile'
end

get '/post' do
	@user = current_user
	if @user
		erb :post
	else
		redirect '/'
	end	
end

post '/post' do
	@user = current_user
	@post = @user.posts.create(params[:post])
	redirect '/your_post'
end

get '/your_post' do
	@user = current_user
	@last_post = @user.posts.last
	if @user
		erb :your_post
	else
		redirect '/'
	end
end

post '/your_post' do
	@post = current_user.posts.last
	@post.update(params[:post])
	redirect '/profile'
end

get '/find' do
	@user = current_user
	erb :find
end

post '/find' do
	@search_term = "%#{params[:name]}%"
	@results = User.where("name LIKE ?", @search_term)
	erb :find
end

get '/your_post' do
	@user = current_user
	erb :your_post
end

get '/delete_account' do
	@user = current_user
	@user.destroy
	session[:user_id] = nil
	redirect '/'
end

get '/delete_post/:id' do
	@post = Post.find(params[:id])
	@post.destroy
	redirect '/profile'
end

get '/logout' do
	session[:user_id] = nil
	redirect '/'
end


# post '/search_for_user' do
# 	puts "DID THE THING #{params[:search_term]}"
# 	@users = User.where('name LIKE ?', "%#{params[:search_term]}%")
# 	erb :search_results, layout: false
# end
