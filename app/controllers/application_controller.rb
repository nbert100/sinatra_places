require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "places_app"
  end

  get "/" do
    erb :welcome
  end
  
  helpers do
    def logged_in?
      # true if use is logged in, otherwise false
      !!current_user
    end
    
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
      #energy saver
    end
  end 

end
