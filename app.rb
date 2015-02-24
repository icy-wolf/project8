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
    	date = params['select_date'].split("/")
      if ['BE', 'BR', 'GB', 'US'].include? params['country']
    	  @day = HolidApi.get(country: params['country'], year: date[2], month: date[0])
      else
        @day = HolidApi.get(country: 'US', year: date[2], month: date[0])
      end
    end
    @holidays = HolidApi.get(country: 'US', year: 1993, month: 8)
    erb :index
  end
end