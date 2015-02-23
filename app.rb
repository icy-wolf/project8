# app.rb
require 'sinatra'
require 'holidapi'

class HolidaIndustriesApp < Sinatra::Base
  get '/' do
  	puts params
  	if params['select_date'].nil?
  		t = Time.now
    	@day = HolidApi.get(country: 'us', year: t.year, month: t.month)
    else
    	date = params['select_date'].split("-")
    	@day = HolidApi.get(country: params['country'], year: date[0], month: date[1])
    end
    @holidays = HolidApi.get(country: 'us', year: 1993, month: 8)
    erb :index
  end
end