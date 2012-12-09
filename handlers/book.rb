#This is the place where anything that has to do directly with books lives.

get "/books" do
  @books = Book.all
  erb :"books/index"
end