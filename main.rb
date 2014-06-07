require 'sinatra'
require 'slim'
require 'sass'

enable :sessions

require_relative 'business'
require_relative 'mongo_config'

require 'sinatra/reloader' if development?

get('/css/styles.css') {scss :style}

get '/'  do
	slim :login
end

post '/login' do
	username = params[:username]
	password = params[:password]

	if User.where(:username => username,  :password => password).any?
		session["user"] = username
		"Good!"
	else
		@error = "Invalid credentials"
		slim :login
	end
end

get '/book' do
	if session["user"]
		slim :new_book
	else
		@error = "Please login"
		slim :login
	end
end