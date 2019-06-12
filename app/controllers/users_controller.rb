class UsersController < ApplicationController

  get '/login' do
    erb :'/users/login'
  end

  post '/login' do
    if user = User.find_by(username: params[:username])
      session[:user_id] = user.id if user.authenticate(params[:password])
      redirect '/games'
    end
      redirect '/'
  end

  get '/signup' do

    erb :'/users/create_user'
  end

  post '/signup' do
    if !(params[:user][:username].strip.empty? || params[:user][:email].strip.empty? || params[:user][:password].strip.empty?)
      @user = User.create(params[:user])
      session[:user_id] = @user.id
      redirect '/games'
    end
    redirect "/"
  end

end
