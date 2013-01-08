require 'open-uri'
require 'json'

front_page = JSON.parse(open("http://www.reddit.com/.json").read)
i = 0

puts "\n\n"

for item in front_page["data"]["children"].collect{|x| x["data"]["title"]}
   puts "      #{i}       #{item} \n\n"

   i += 1
end
