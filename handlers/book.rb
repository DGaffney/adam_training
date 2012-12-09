#This is the place where anything that has to do directly with books lives.

get "/books" do
  @books = Book.all
  erb :"books/index"
end

get "/books/new" do
  erb :"books/new"
end

post "/books/new" do
  puts params.inspect
  @book = Book.new
  @book.title = params[:title]
  @book.number_of_pages = params[:number_of_pages]
  puts @book.inspect
  @book.save
  erb :"books/index"
end

# self.erb(:"some/path/to/a/file") => Go look in the views folder, find the file matching
# the path that was sent in, and start filling in all the blanks where there are <% %> tags.