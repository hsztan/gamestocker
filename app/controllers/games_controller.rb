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

  get '/games/:id/edit' do
    redirect '/login' if !logged_in?
    @game = Game.find(params[:id])
    if current_user.games.include?(@game)
      erb :'/games/edit_game'
    else
      flash[:error] = "Don't try to edit someone else's game or else..."
      redirect '/games'
    end
  end

  patch '/games/:id/edit' do

  end

  delete '/games/:id/delete' do
    redirect '/' if !logged_in?
    @game = Game.find(params[:id])
    if current_user.games.include?(@game)
      flash[:error] = "You have destroyed #{@game.name}, no going back now..."
      @game.destroy
      erb :'/games'
    else
      flash[:error] = "Don't destroy a game that isn't yours please"
      redirect '/games'
    end
  end

  patch '/games/:id/edit' do
    redirect "/games/#{params[:id]}/edit" if params[:game][:name].empty?
    game = Tweet.find(params[:id])
    game.update(params[:game])
    redirect "/games/#{game.id}"
  end

end
