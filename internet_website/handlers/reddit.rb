get "/reddit" do
  @posts = Post.all
  erb :"reddit/index"
end

get "/books/new" do
  reddit = Snoo::Client.new
  