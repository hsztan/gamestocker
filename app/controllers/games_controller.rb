class GamesController < ApplicationController

  get '/games' do
    if logged_in?
      @user = current_user
      erb :'/games/games'
    else
      redirect "/"
    end
  end

  get '/games/:id' do
    redirect "/" if !logged_in?

    @game = Game.find_by(params)
    erb :'/games/show_game'
  end

end
