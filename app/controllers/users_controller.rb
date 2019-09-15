class UsersController < ApplicationController
  
  get '/login' do
    erb :login
  end
  
  post '/login' do
      @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:message] = "Hi, #{@user.name}!"
      redirect "users/#{@user.id}"
    else 
      flash[:error] = "Invalid Entry. Please try again."
      redirect "/login"
    end
  end

  get '/signup' do
    erb :signup
  end
  
  post '/users' do 
    @user = User.new(params)
      if @user.save
      session[:user_id] = @user.id
      flash[:message] = "Sign Up Successful! Welcome #{@user.name}!"
      redirect "/users/#{@user.id}"
    else 
      flash[:error] = "Oops! #{@user.errors.full_messages.to_sentence}"
      redirect '/signup'
    end
  
  end
  
  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    redirect_if_not_logged_in
    erb :'/users/show'
  end
  
  get '/logout' do 
    session.clear
    flash[:message] = "See you soon!"
    redirect '/'
  end
end