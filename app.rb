# app.rb
require 'sinatra'

class MyWebApp < Sinatra::Base
  get '/' do
  send_file "views/index#{ rand(3) + 1 }.html"
end
end