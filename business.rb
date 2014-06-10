require 'mongo_mapper'

class User
    include MongoMapper::Document
     
    key :username,   String,   :required => true
    key :password,   String,   :required => true
    key :first_name, String
    key :last_name,  String
    timestamps!
end

class Book
    include MongoMapper::Document
     
    key :title,       String,   :required => true
    key :author,      String,   :required => true
    key :price,       Float
    key :type,        String
    key :publisher,   String
    key :language,    String
    key :pages,       Integer
    key :cover,       Binary
    key :cover_name,  String
    key :description, String
    key :genere,      String
    timestamps!
end