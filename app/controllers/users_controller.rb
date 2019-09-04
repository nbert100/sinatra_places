class UsersController < ApplicationController
  
  #routes needed for someone to log in 
  
  #purpose of this rute is to render log in page (form)
  get '/login' do
    erb :login
  end
  
  
  #sign up?
end