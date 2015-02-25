# app.rb
require 'sinatra'
require 'holidapi'

class HolidaIndustriesApp < Sinatra::Base
  get '/' do
  	puts params

    #if date is NULL
  	if params['select_date'].nil?
  		t = Time.now
    	@day = HolidApi.get(country: 'us', year: t.year, month: t.month)
    #else date is selected
    else
    	date = params['select_date'].split("/")
      #if country is NOT null
      if ['BE', 'BR', 'GB', 'US'].include? params['country']
        #if day is set
        @day = HolidApi.get(country: params['country'], year: date[2], month: date[0], day: date[1])
        #else day not set
          #call for whole month
      #else assume 'Merica
      else
        #if day set
        @day = HolidApi.get(country: 'US', year: date[2], month: date[0], day: date[1])
        #else no day
          #call for month
      end
    end
    @holidays = HolidApi.get(country: 'US', year: 1993, month: 8)
    erb :index
  end
end