# app.rb
require 'sinatra'
require 'holidapi'

class HolidaIndustriesApp < Sinatra::Base
  get '/' do
  	puts params

    #if date is NULL show current month
  	if params['select_date'].nil?
  		t = Time.now
    	@day = HolidApi.get(country: 'us', year: t.year, month: t.month)
    #else date is selected
    else
    	date = params['select_date'].split("/")
      #if country is NOT null
      if ['BE', 'BR', 'GB', 'US'].include? params['country']
        if date[1].empty? || date[1].nil?
          @day = HolidApi.get(country: params['country'], year: date[2], month: date[0])
        else
          @day = HolidApi.get(country: params['country'], year: date[2], month: date[0], day: date[1])
        end
      #else assume 'Merica
      else
        if date[1].empty? || date[1].nil?
          @day = HolidApi.get(country: 'US', year: date[2], month: date[0])
        else
          @day = HolidApi.get(country: 'US', year: date[2], month: date[0], day: date[1])
        end
      end
    end

    #Nicole's month of Birth
    @holidays = HolidApi.get(country: 'US', year: 1993, month: 8)
    
    erb :index
  end
end