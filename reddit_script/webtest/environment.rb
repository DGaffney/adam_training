require 'bundler/setup'
require 'sinatra'
require 'sinatra/mongomapper'
require 'mongo_mapper'
require 'erb'
require 'yaml'
require 'digest/sha1'
require 'hashie'
require 'open-uri'
require 'json'
require 'snooby'

ENVIRONMENT = "development"

current = File.dirname(__FILE__)
config = YAML::load_file("#{current}/config/database.yml")[ENVIRONMENT]
set :mongo_logfile, File.join("log", "mongo-driver-#{ENVIRONMENT}")
set :mongomapper, "#{config["adapter"]}://#{config["host"]}:#{config["port"]}/#{config["database"]}"

Dir[File.dirname(__FILE__) + '/extensions/*.rb'].each {|file| require file}
Dir[File.dirname(__FILE__) + '/helpers/*.rb'].each {|file| require file}                 
Dir[File.dirname(__FILE__) + '/handlers/*.rb'].each {|file| require file}                 
Dir[File.dirname(__FILE__) + '/models/*.rb'].each {|file| require file}                 
Dir[File.dirname(__FILE__) + '/before_hooks/*.rb'].each {|file| require file}                 

helpers LoginHelper
enable :sessions