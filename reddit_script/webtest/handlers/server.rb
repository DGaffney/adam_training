get '/login' do
  @title = "login"
  erb :"login"
end

post '/login' do
  session[:user] = params[:user]
  session[:password] = params[:password]
  redirect '/r/all'
end

get '/logout' do
  session.clear
  redirect '/r/all'
end

get '/' do
  redirect '/r/all'
end

get '/r/:subreddit' do
  subreddit_title = params[:subreddit]
  @@comments = Comment.get_comments_for_subreddit(subreddit_title, session)
  @title = "/r/#{params[:subreddit]}"
  erb :"index"
end

get '/reply/:parent_name' do
  parent_name = params[:parent_name]
  @@parent_comment = @@comments.find {|comment| comment.name === parent_name}
  @title = "/r/#{@@parent_comment.subreddit}"
  erb :"reply"
end

post '/reply/:parent_name' do
  reply_body = params[:reply_body]
  @@parent_comment.reply(reply_body)
  redirect "/r/#{@@parent_comment.subreddit}"
end

get '/request' do
  request.env.map { |e| e.to_s + "\n"}
end