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
