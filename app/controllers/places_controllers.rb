class PlacesController < ApplicationController

  get '/places/new' do
      erb :'/places/new'
  end 
   
  # get '/places' do
  #   @places = Place.all
  #   erb :'/places/index'
  # end
  
  #get places new to render form to create new entry
 
  
  #post places to create new places
  
  post '/places' do
    #want to create new place and save it to the database but only if it has content
    #and only if user is logged in 
    if !logged_in?
      redirect '/'
    end
    if params[:city_name] != ""
      @place = Place.create(city_name: params[:city_name], user_id: current_user.id)
      redirect "/places/#{@place.id}" 
      #not able to redirect here. should it be @place.user.id?
    else
      redirect '/places/new'
  end
end
#   #show route for place
  get '/places/:id' do 
    set_place
    erb :'/places/show'
  end
  
  #should send up to places/edit.erb which will render edit form
  get '/places/:id/edit' do
   set_place
    erb :'/places/edit'
  end
  
  patch '/places/:id' do
    set_place
    #update place
    @place.update(city_name: params[:city_name])
    #redirect to ? probably show page
    redirect "/places/#{@place.id}"
  end
  
  private 
   
   def set_place
     @place = Place.find(params[:id])
   end
end