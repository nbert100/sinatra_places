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
    @place = Place.find(params[:id])
    erb :'/places/show'
  end
  
#   #this route should send us to places/edit.erb which will render an edit form
#   #should make sure can only edit own entry
#   #should not be able to create blank entry
#   get '/places/:id/edit' do
#     set_place
#     if authorized_to_edit?(@place)
#         erb :'/places/edit'
#       # else
#       #   #user homepage? or index of all places
#       #   redirect "/users/#{current_user.id}"
#       # end
#     else
#       redirect '/'
#     end
#   end
  
#   patch '/places/:id' do
#     set_place
#     if logged_in?
      
#       if authorized_to_edit? && params[:city_name] != ""
#         @place.update(city_name: params[:city_name])
#         redirect "/places/#{@place.id}"
#       else
#         redirect "users/#{current_user.id}"
#       end
#     else
#       redirect '/'
#     end
#   end
# #job is to delete journal entry (not its job to show anything) 
#   delete '/places/:id' do
#     set_place
#     if authorized_to_edit?(@place)
#       @place.destroy
#       redirect '/places'
#     else
#       redirect '/places'
#     end
#   end
  
#   private
  
#   def set_place
#     @place = Place.find(params[:id])
#   end
# end
end