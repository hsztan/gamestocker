class GamesController < ApplicationController

  get '/games' do
    erb :'/games/games' if logged_in?
    redirect "/"
  end

end
