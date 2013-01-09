require 'open-uri'
require 'json'
require 'snoo'

reddit = Snoo::Client.new

print 'Username: '
name = gets.chomp
#print name

print 'Password: '
pass = gets.chomp
#print pass

reddit.log_in(name, pass) 
reddit.send_pm 'QuantumBreakfast', 'hnnnnggg', "daddy wants to fuck"
# okay = false
# print 'hey, ' + name + '. say \'link\' to post a link or say \'text\' to make a text post: '
# while okay == false
   
#    type = gets.chomp

#    if type == 'link'
#       print 'enter url: '
#       post = { text: gets.chomp }
#       okay = true
#    elsif type == 'text'
#       print 'write post: '
#       post = { url: gets.chomp }
#       okay = true
#    else
#       print 'try again? '
#    end
# end

# print 'title: '
# title = gets.chomp

# print 'subreddit (try adamtest): '
# subreddit = gets.chomp

# reddit.submit(title, subreddit, post)

reddit.log_out
# front_page = JSON.parse(open("http://www.reddit.com/.json").read)
# i = 0

# puts "\n\n"

# for item in front_page["data"]["children"].collect{|x| x["data"]["title"]}
#    puts "      #{i}       #{item} \n\n"

#    i += 1
# end