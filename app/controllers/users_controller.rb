class UsersController < ApplicationController
  
  #purpose of this rute is to render log in page (form)
  get '/login' do
    erb :login
  end
  
  #post usually creates something new (action going to be url)
  #creating a key value pair to the session hash (creating a session)
  #the purpose of this route is to receive the login form, find the use and log the user in
  
  post '/login' do
    #find user 
    @user = User.find_by(username: params[:username])
    #authenticate user 
    if @user && @user.authenticate(params[:password])
    #log user in - create user session
    session[:user_id] = @user.id
    #redirect to user
    redirect "users/#{@user.id}"
  else 
    flash[:error] = "Invalid Entry. Please try again."
    redirect "/login"
  end
end

  #sign up?
  # job is to render the signup form
  get '/signup' do
    erb :signup
  end
  
  post '/users' do 

    #here is where we will create a new user and persist the new user to the database
    #only want to persist a user that has a name, username and pw
    #only job is to create, NOT show
    if params[:name] != "" && params[:username] && params[:password]
      @user = User.create(params)
      session[:user_id] = @user.id
      # go to user show page? 
      redirect "/users/#{@user.id}"
    else 
      #invalid
      #stretch goal to include error message
      redirect '/signup'
    end
  end
  
  get '/users/:id' do
    @user = User.find_by(id: params[:id])
   erb :'/users/show'
  end
  
  get '/logout' do 
    session.clear
    redirect '/'
  end
end