get "/authors" do
  @authors = Author.all
  erb :"authors/index"
end

get "/authors/new" do
  erb :"authors/new"
end

post "/authors/new" do
  puts params.inspect
  @author = Author.new
  @author.firstname = params[:firstname]
  @author.lastname = params[:lastname]
  puts @author.inspect
  @author.save
  redirect "/authors"
end


get "/authors/edit/:author_id" do
  @author = Author.first(:id => params[:author_id])
  erb :"authors/edit"
end

post "/authors/edit/:author_id" do
  puts params.inspect
  @author = Author.first(:id => params[:author_id])
  @author.firstname = params[:firstname]
  @author.lastname = params[:lastname]
  puts @author.inspect
  @author.update
  redirect "/authors"
end

get "/authors/destroy/:author_id" do
  @author = Author.first(:id => params[:author_id])
  @author.destroy
  redirect "/authors"
end