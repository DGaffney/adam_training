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
  @@comments = Comment.get_comments_for_subreddit(subreddit_title, session)
  erb :"index"
end

get '/reply/:parent_name' do
  parent_name = params[:parent_name]
  @@parent_comment = @@comments.find {|comment| comment.name === parent_name}
  erb :"reply"
end

post '/reply/:parent_name' do
  reply_body = params[:reply_body]
  @@parent_comment.reply(reply_body)
  redirect "/#{@@parent_comment.subreddit}"
end

get '/:subreddit' do
  subreddit_title = params[:subreddit]
  @@comments = Comment.get_comments_for_subreddit(subreddit_title, session)
  erb :"index"
end