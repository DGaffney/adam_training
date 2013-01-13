require 'open-uri'
require 'json'
require 'snoo'

reddit = Snoo::Client.new

comments = reddit.get_comments( { :subreddit => "science", 
                                  :depth => 1, 
                                  :limit => 25 } )["data"]["children"].collect { |x| x["data"] }

comments.each { |x| print "...title... #{x["link_title"]}\n
                          \n
                          ...body....#{x["body"]}\n
                          \n
                          ...author..#{x["author"]}\n
                          \n
                          \n" }

#right now this only gets the first 25 comments posted to any topic to the science subreddit...