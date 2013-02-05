class Post
  include MongoMapper::Document
  key :author, String
  key :author_flair_css_class, String
  key :author_flair_text, String
  key :clicked, Boolean
  key :created, Float
  key :created_utc, Float
  key :domain, String
  key :downs, Fixnum
  key :hidden, Boolean
  key :id, String
  key :is_self, Boolean
  key :likes, String
  key :media, String
  key :media_embed, Hash
  key :name, String
  key :num_comments, Fixnum
  key :over_18, Boolean
  key :permalink, String
  key :saved, Boolean
  key :score, Fixnum
  key :selftext, String
  key :subreddit, String
  key :subreddit_id, String
  key :thumbnail, String
  key :title, String
  key :ups, Fixnum
  key :url, String

  def self.get_posts_for_subreddit(subreddit_title, session)
    reddit = Snooby::Client.new('Quantumbreakfast Test Bot')
    reddit.authorize!(session[:user], session[:pass])
    posts = reddit.subreddit(subreddit_title).posts
    Post.store_posts(posts)
    return posts
  end

  def self.store_posts(posts)
    posts.each do |post|     
      p = Post.new
      p.author = post.author
      p.author_flair_css_class = post.author_flair_css_class
      p.author_flair_text = post.author_flair_text
      p.clicked = post.clicked
      p.created = post.created
      p.created_utc = post.created_utc
      p.domain = post.domain
      p.downs = post.downs
      p.hidden = post.hidden
      p.id = post.id
      p.is_self = post.is_self
      p.likes = post.likes
      p.media = post.media
      p.media_embed = post.media_embed
      p.name = post.name
      p.num_comments = post.num_comments
      p.over_18 = post.over_18
      p.permalink = post.permalink
      p.saved = post.saved
      p.score = post.score
      p.selftext = post.selftext
      p.subreddit = post.subreddit
      p.subreddit_id = post.subreddit_id
      p.thumbnail = post.thumbnail
      p.title = post.title
      p.ups = post.ups
      p.url = post.url

      p.save
    end
  end
end

Post.ensure_index [[:name, 1]], :unique => true