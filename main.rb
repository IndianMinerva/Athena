require 'sinatra'
require 'slim'
require 'sass'

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
		"Good!"
	else
		slim :login
	end
end