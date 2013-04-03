require 'bundler/setup'
require 'sinatra'
require 'omniauth-github'

get '/' do
  "Hello World!"
end

