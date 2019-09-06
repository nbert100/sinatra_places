class UsersController < ApplicationController
  
  #routes needed for someone to log in 
  
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
    if @user.authenticate(params[:password])
    #log user in - create user session
    session[:user_id] = @user.id
    #redirect to user
    redirect "users/#{@user.id}"
  else 
    #error message
    #redirect to log in page 
  end
  #sign up?
  
  get '/signup' do
  end
  
  get '/users/:id' do
    "user show route"
  end
end