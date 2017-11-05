require 'sinatra'
require 'sinatra/activerecord'
require './models'

set :database, "sqlite3:main.sqlite3"

get '/' do
  erb :home
end 

get '/sign_in' do
	erb :sign_in
end

get '/welcome' do
	erb :welcome
end

get '/create_account' do 
	erb :create_account
end

get '/profile' do
	erb :profile
end

get '/profile_posts' do
	erb :profile_posts
end

get '/change_details' do
	erb :profile_posts
end

get '/post' do
	erb :post
end

get '/find' do
	erb :find
end

get '/found' do
	erb :found
end

get '/your_post' do
	
	erb :your_post
end


post '/create_account' do

	erb :welcome
end

post '/sign_in' do
	
	erb :welcome
end

post '/find' do
	
	erb :found
end

post '/post' do
	
	erb :your_post
end