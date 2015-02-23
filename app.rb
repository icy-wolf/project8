# app.rb
require 'sinatra'
require 'holidapi'

class HolidaIndustriesApp < Sinatra::Base
  get '/' do
  	t = Time.now
    @holidays = HolidApi.get(country: 'us', year: 1993, month: 8)
    @day = HolidApi.get(country: 'us', year: t.year, month: t.month)
    erb :index
  end
end