class UsersController < ApplicationController

  get '/login' do
    erb :'/users/login'
  end

  post '/login' do
    if user = User.find_by(username: params[:username])
      session[:user_id] = user.id if user.authenticate(params[:password])
      redirect '/games'
    end
      flash[:error] = "Incorrect Login. Please try harder next time..."
      redirect '/'
  end

  post '/signout' do
    if logged_in?
      session.clear
      flash[:error] = "You have been successfully signed out!"
    end
    erb :index  #If used a redirect to route '/' the flash[:error would be deleted]
  end

  get '/signup' do

    erb :'/users/create_user'
  end

  post '/signup' do
    if !(params[:user][:username].strip.empty? || params[:user][:email].strip.empty? || params[:user][:password].strip.empty?)
      if User.find_by(username: params[:user][:username])  ### If user already exists...
        flash[:error] = "User already exists, gotta be more creative!"
        redirect '/'
      else
        @user = User.create(params[:user])
        session[:user_id] = @user.id
        redirect '/games'
      end
    end
    flash[:error] = "Please fill out all fields, don't be lazy!"
    redirect "/"
  end

  get '/users' do
    if logged_in?
      @user = current_user
      erb :'/users/show'
    else
      redirect "/"
    end
  end

end
