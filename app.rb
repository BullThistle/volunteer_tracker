require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/project'
require 'pry'
require 'pg'

get '/' do
  erb:main
end
