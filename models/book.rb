class Book
  #db.adam_test_development.save({"title": "wonderbra", "number_of_pages": 2})
  include MongoMapper::Document
  key :title, String
  #self.key(:title, String)
  key :number_of_pages, Integer
  #self.key(:number_of_pages, Integer)
  timestamps!

  def butts
    return "hey"
  end
  
  def butts!
    return "hey"
  end
end

# module MongoMapper::Document
#   def timestamps!
#     key :created_at, DateTime, :default => Time.now
#     key :updated_at, DateTime, :default => Time.now
#   end
# end