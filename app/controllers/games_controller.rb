class GamesController < ApplicationController

  def index
    @games = Game.all
  end


  def new
    @game = Game.new

  end

  def show
    @game = Game.find(game_id)
  end

  def decide_game_view
    @game = Game.find(game_id)



    if @game.winner && @game.loser
      puts 'winner/loser'
      redirect_to @game
    else
      redirect_to edit_game_path(@game)
    end
  end

  def edit

  end


  def create
    @game = Game.new(game_params)
    # puts @game.location


    if @game.save
      flash[:notice] = "New Game Scheduled!"
      redirect_to games_path
    else
      flash[:notice] = "Could Not Schedule a Game.  Try Again."
      redirect_to new_games_path
    end
  end

private
  def game_params
    params.require(:game).permit(:home_id, :visitors_id, :location_id, :date, :time)
  end
  def game_id
    params.require(:id)
  end

end
