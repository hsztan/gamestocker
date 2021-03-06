require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "Antonio Reid"
    use Rack::Flash, :sweep => true
  end

  get "/" do
    erb :index
  end

  post "/" do
    redirect "/login" if params[:login]
    redirect "/signup"
  end

  helpers do
    def current_user
      @user = User.find_by_id(session[:user_id])
    end

    def logged_in?
      !!session[:user_id]
    end
  end
end
