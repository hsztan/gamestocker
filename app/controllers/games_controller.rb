class GamesController < ApplicationController

  get '/games' do
    if logged_in?
      @user = current_user
      erb :'/games/games'
    else
      redirect "/"
    end
  end

end
