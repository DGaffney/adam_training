require 'open-uri'
require 'json'
require 'snoo'

#Ultimate goal is simply to read the titles of the posts on the front page and then subsequently
#post the top comment for that post.

reddit = Snoo::Client.new

#Get the posts on the front page.
#--This returns an array of hashes, each hash corresponds to a post.
listing = reddit.get_listing["data"]["children"].collect { |x| x["data"] }

#Filter each post for the values we're interested in.
#--Go through each hash in the listing array; for each key-value pair in the hash, keep it only if it's the kind we want.
#--Ultimately returns an array of hashes.
listing.each { |x| x.keep_if { |key, val| key == "title" || 
                                          key == "subreddit" || 
                                          key == "id" } }

#Create an array containing the data hashes of the first comments on each post
#--For each hash (post) in the listing array, pass the hash's values for 
#----subreddit and id as arguments in the hash that snoo.get_comments requests.
#----:limit 1 points to the top post in that comment thread.
#--This creates an array of fuckall hashes name 'comments'.
comments = listing.map { |x| reddit.get_comments({:subreddit => x["subreddit"], :link_id => x["id"], :limit => 1}) }

#Print the horrible god forsaken mess that is the comments array.
p comments





#----"comments[0][1]["data"]["children"][0]["data"]["body"]" should address the 
#----body of the first comment in the comments array, but it seems hacky and
#----i am looking for a better way.