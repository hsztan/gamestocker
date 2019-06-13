class GamesController < ApplicationController

  get '/games' do
    if logged_in?
      @user = current_user
      erb :'/games/games'
    else
      redirect "/"
    end
  end

  get '/games/new' do
    if logged_in?
      @consoles = Console.all
      erb :'/games/new'
    else
      redirect '/'
    end
  end

  post '/games/new' do
    # TODO: Validate if game with its given console already exist...
    if params[:game][:name].strip.empty?
      flash[:error] = "You´re game must have a name!"
      redirect "/games/new"
    elsif !params[:console][:name].strip.empty?
      console = Console.create(params[:console])
      params[:game][:console_id] = console.id
      params[:game][:user_id] = current_user.id
      game = Game.create(params[:game])
      redirect '/games'
    else
      params[:game][:user_id] = current_user.id
      game = Game.create(params[:game])
      redirect "/games"
    end
  end

  get '/games/:id' do
    redirect "/" if !logged_in?

    if @game = Game.find_by(params)
      erb :'/games/show_game'
    else
      flash[:error] = "Couldn't find that game!"
      redirect "/games"
    end
  end

  get '/games/:id/edit' do
    redirect '/login' if !logged_in?
    @game = Game.find(params[:id])
    if current_user.games.include?(@game)
      @consoles = Console.all
      erb :'/games/edit_game'
    else
      flash[:error] = "Don't try to edit someone else's game or else..."
      redirect '/games'
    end
  end
  #
  # patch '/games/:id/edit' do
  #   redirect "/games/#{params[:id]}/edit" if params[:game][:name].empty?
  #   game = Tweet.find(params[:id])
  #   game.update(params[:game])
  #   redirect "/games/#{game.id}"
  # end

  delete '/games/:id/delete' do
    redirect '/' if !logged_in?
    @game = Game.find(params[:id])
    if current_user.games.include?(@game)
      flash[:error] = "You have destroyed #{@game.name}, no going back now..."
      @game.destroy
      redirect "/games"
    else
      flash[:error] = "Don't destroy a game that isn't yours please"
      redirect '/games'
    end
  end


end
