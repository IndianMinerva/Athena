require 'mongo_mapper'

class User
    include MongoMapper::Document
     
    key :username,   String,   :required => true
    key :password,   String,   :required => true
    key :first_name, String
    key :last_name,  String
    timestamps!
end
