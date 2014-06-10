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

get '/book/new' do
	@title="New Book"
	if session["user"]
		slim :new_book
	else
		@error = "Please login"
		slim :login
	end
end

get '/book/:id' do
	@book = Book.find(params['id'])
	if @book.nil?
		"No such book"
	else
		slim :view_book
	end
end

post '/book' do
	cover = params["cover"]
	params.delete("cover")
	book = Book.new(params)
	if cover
		book[:cover] = cover[:tempfile].read
		book[:cover_name] = cover[:name]
	end
	book.save
	book.keys.to_s
end

get '/cover/:id/cover' do
	book = Book.find(params['id'])

	content_type 'image/jpeg'
	#content_length book.cover.length
	response.write(book.cover)
end

get '/books' do
	@books = Book.all
	slim :list_book
end