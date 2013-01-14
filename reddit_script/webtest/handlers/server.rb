get '/login' do
  erb :"login"
end

post '/login' do
  session[:user] = params[:user]
  session[:password] = params[:password]
  redirect "/"
end

get '/logout' do
  session.delete(:user)
  session.delete(:password)
  redirect "/"
end

get '/' do
  subreddit_title = "all"
  @comments = Comment.get_comments_for_subreddit(subreddit_title, session)
  erb :"index"
end

get '/:subreddit' do
  subreddit_title = params[:subreddit]
  @comments = Comment.get_comments_for_subreddit(subreddit_title, session)
  erb :"index"
end  