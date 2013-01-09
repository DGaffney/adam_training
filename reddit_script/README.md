adam_training
=============
_A training repository for teaching Adam Sinatra, Mongo, Ruby, and general development._
  
reddit_script
-------------

 require 'open-uri'  
 require 'json'  
### _Without a gem, you can live in this world._  
 front_page = JSON.parse(open("http://www.reddit.com/.json").read)

### _With a gem, you can get a little crazy_...  
 require 'snoo'

### _Create a new instance of the client_
 reddit = Snoo::Client.new

### _Log into reddit_
 reddit.log_in 'Username', 'Password'
  
  
#### To look at the things that this gem can do visit this site: https://github.com/paradox460/snoo/
  
  
## Examples:
 
### _Get the titles for the top 25 reddits_
 JSON.parse(reddit.get_reddits.body)["data"]["children"].collect{|x| x["data"]["title"]}
  
### _Get the marker for the next page of data_
 JSON.parse(reddit.get_reddits.body)["data"]["after"] #this would evaluate to some string, in this case  its "t5_2vz7o"
 JSON.parse(reddit.get_reddits(:after => "t5_2vz7o").body)["data"]["children"].collect{|x| x["data"]["title"]}
  
  
---  
  
 your goal is to get your bot to post something to reddit, and to post
something to that post on reddit. make an account for the bot,
then just maybe even make your own subreddit, and post to it.  
   
 for the above task, I should be able to, from the command line,
type ruby the_file.rb username password, and it should send in the post.
if you want to get a little further, expose the title and the body by
letting me type that into the command line as well. Google ARGV ruby
command line arguments to figure out how to do that.  
  
 if this goal is finished, the next step would be to send in the title
and content of a post FROM your website THROUGH sinatra USING snoo,
the reddit gem. Make it happen.  
  
 This one should be pretty straightforward - I want to have a form on a
webpage that shows me a form, with nice input boxes for the username,
password, title, and content (and subreddit as well I suppose), and
return to me with the link of where this content has been published.  
  
 if both goals are satisfied, come to me with something cool, like keeping
track of the number of times a day someone the term "moose knuckle" shows
up on reddit every day.
