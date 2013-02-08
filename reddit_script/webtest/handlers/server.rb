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

get '/r/:subreddit_title' do
  @@subreddit_title = params[:subreddit_title]
  
  @@posts = Post.get_posts_for_subreddit(@@subreddit_title,session)

  @title = "/r/#{@@subreddit_title}"
  erb :"subreddit"
  binding.pry
end

get '/post/:post_name' do
  @@post_name = params[:post_name]
  
  @@post = @@posts.find {|post| post.name === @@post_name}
  @@comments = Comment.get_comments_for_post(session)

  @title = "/post/#{@@post_name}"
  erb :"post"
end

get '/reply/:comment_name' do
  @@comment_name = params[:comment_name]

  @@comment = @@comments.find {|comment| comment.name === @@comment_name}

  @title = "/post/#{@@post_name}"
  erb :"reply"
end

post '/reply/:comment_name' do
  @reply_body = params[:reply_body]

  @@comment.reply(@reply_body)

  redirect "/post/#{@@post_name}"
end

get '/dostuff' do
  @count = Comment.count
  Comment.get_comments_for_all(session)

  @countdiff = Comment.count - @count

  @title = "stuff"
  erb :"stuff"
end