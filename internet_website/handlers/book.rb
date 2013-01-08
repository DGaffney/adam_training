#This is the place where anything that has to do directly with books lives.

get "/books" do
  @books = Book.all
  erb :"books/index"
end

get "/books/new" do
  @book = Book.new
  erb :"books/new"
end

post "/books/new" do
  puts params.inspect
  @book = Book.new
  @book.title = params[:title]
  @book.number_of_pages = params[:number_of_pages]
  puts @book.inspect
  @book.save
  redirect "/books"
end


get "/books/edit/:book_id" do
  @book = Book.first(:id => params[:book_id])
  erb :"books/edit"
end

post "/books/edit/:book_id" do
  puts params.inspect
  @book = Book.first(:id => params[:book_id])
  @book.title = params[:title]
  @book.number_of_pages = params[:number_of_pages]
  puts @book.inspect
  @book.update
  redirect "/books"
end

get "/books/destroy/:book_id" do
  @book = Book.first(:id => params[:book_id])
  @book.destroy
  redirect "/books"
end

# self.erb(:"some/path/to/a/file") => Go look in the views folder, find the file matching
# the path that was sent in, and start filling in all the blanks where there are <% %> tags.