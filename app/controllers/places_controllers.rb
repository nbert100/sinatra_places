class PlacesController < ApplicationController
  #get places new to render form to create new entry
  get '/places/new' do
    erb :'/places/new'
  end
  
  #post places to create new places
  
  post '/places' do
    #want to create new place and save it to the database but only if it has content
    #and only if user is logged in 
    if !logged_in?
      redirect '/'
    end
    if params[:city_name] !=""
      @place = Place.create(city_name: params[:city_name], user_id: current_user.id)
      redirect "/places/#{@place.id}"
    else
      redirect '/places/new'
  end
  
  #show route for place
  get '/places/:id' do 
    @place = Place.find(params[:id])
    erb :show
  end
  
  #index route for all places
end