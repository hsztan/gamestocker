class GamesController < ApplicationController

  get '/games' do
    if logged_in?
      erb :'/games/games'
    else
      redirect "/"
    end
  end

end
