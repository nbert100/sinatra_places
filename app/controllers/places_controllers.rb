class PlacesController < ApplicationController
  
  get '/places' do
    @places = Place.all
    erb :'/places/index'
  end

  get '/places/new' do
      erb :'/places/new'
  end 
   
  post '/places' do
    redirect_if_not_logged_in
    if params[:city_name] != ""
      @place = Place.create(city_name: params[:city_name], user_id: current_user.id)
      flash[:message] = "#{@place.city_name} added!"
      redirect "/places/#{@place.id}" 
    else
      flash[:error] = "Oops! Please try again."
      redirect '/places/new'
  end
end

  get '/places/:id' do 
      set_place 
      erb :'/places/show'
  end
  
  
  get '/places/:id/edit' do
  set_place
  redirect_if_not_logged_in
      if authorized_to_edit?(@place)
        erb :'/places/edit'
      else
        redirect "users/#{current_user.id}"
      end
  end
  
  patch '/places/:id' do
  set_place
  redirect_if_not_logged_in
      if authorized_to_edit?(@place) && params[:city_name] != ""
        
        city_name = params[:city_name] || @place.city_name
        visited = params[:visited] || @place.visited
        @place.update(city_name: city_name, visited: visited)
      
        flash[:message] = "Change successful!"
        redirect "/places/#{@place.id}"
      else
        flash[:error] = "Oops! Please fill in city name"
        redirect "users/#{current_user.id}"
        
      end
  end
  
  delete '/places/:id' do
    set_place
    if authorized_to_edit?(@place)
      @place.destroy
      flash[:message] = "#{@place.city_name} deleted."
      redirect '/places' 
    else
      flash[:error] = "You tried it! You aren't authorized to edit this page."
      redirect '/places'
    end
  end
  
  private 
   
  def set_place
     @place = Place.find(params[:id])
  end
end