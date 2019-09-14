class PlacesController < ApplicationController
  
  get '/places' do
    @places = Place.all
    erb :'/places/index'
    
    #logged in? if not redirect to login page
    
  end

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
    if params[:city_name] != ""
      flash[:message] = "New place added!"
      @place = Place.create(city_name: params[:city_name], user_id: current_user.id)
      redirect "/places/#{@place.id}" 
    else
      flash[:error] = "Oops! Please try again."
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
    if logged_in?
      if @place.user == current_user
        erb :'/places/edit'
      else
        #you are not authorized to edit this message
        redirect "users/#{current_user.id}"
      end
    else
      redirect '/'
    end
  end
  
  patch '/places/:id' do
  set_place
    if logged_in?
      if @place.user == current_user
        city_name = params[:city_name] || @place.city_name
        visited = params[:visited] || @place.visited
        @place.update(city_name: city_name, visited: visited)
        binding.pry
        redirect "/places/#{@place.id}"
      else 
        redirect "users/#{current_user.id}"
      end
    else
      redirect '/'
    end
  end
  
  delete '/places/:id' do
    set_place
    if authorized_to_edit?(@place)
      @place.destroy
      redirect '/places' 
    else
      redirect '/places'
    end
  end
  
  private 
   
   def set_place
     @place = Place.find(params[:id])
   end
end