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
  end
  #sign up?
  
  get '/signup'
end