class Author
  include MongoMapper::Document
  key :firstname, String
  key :lastname, String
  timestamps!
end