require 'sinatra'
require 'open-uri'
require 'json'
require 'snoo'

get '/' do
  erb :"index"
end  