require_relative 'mongo_config'
require_relative 'business'

user = User.new(:username => 'admin', :password => 'Poseidon1202', :first_name => 'Admin', :last_name => 'Admin')
user.save