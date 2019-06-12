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

  end

  post '/signup' do

  end

end
