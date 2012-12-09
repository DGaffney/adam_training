get "/" do
  puts params.inspect
  erb :"hello"
end
