class Comment  
  include MongoMapper::Document
  key :author, String
  key :author_flair_css_class, String
  key :author_flair_text, String
  key :body, String
  key :created, Float
  key :created_utc, Float
  key :downs, Fixnum
  key :id, String
  key :likes, String
  key :link_id, String
  key :link_title, String
  key :name, String
  key :parent_id, String
  key :replies, String
  key :subreddit, String
  key :subreddit_id, String
  key :ups, Fixnum
  
  def self.get_comments_for_subreddit(subreddit_title, session)
    reddit = Snooby::Client.new('Adam Test Bot')
    reddit.authorize!(session[:user], session[:password])
    comments = reddit.subreddit(subreddit_title).comments
    Comment.store_comments(comments)
    return comments
  end

  def self.store_comments(comments)
    comments.each do |comment|
      c = Comment.new
      c.author = comment.author
      c.author_flair_css_class = comment.author_flair_css_class
      c.author_flair_text = comment.author_flair_text
      c.body = comment.body
      c.created = comment.created
      c.created_utc = comment.created_utc
      c.downs = comment.downs
      c.id = comment.id
      c.likes = comment.likes
      c.link_id = comment.link_id
      c.link_title = comment.link_title
      c.name = comment.name
      c.parent_id = comment.parent_id
      c.replies = comment.replies
      c.subreddit = comment.subreddit
      c.subreddit_id = comment.subreddit_id
      c.ups = comment.ups
      c.save
    end
  end

end
Comment.ensure_index [[:name, 1]], :unique => true
